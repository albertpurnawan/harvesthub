import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:harvesthub_mobile/app/widgets/app_scaffold.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../app/router/app_router.dart';
import 'package:harvesthub_mobile/data/constants/task_status.dart';
import 'package:harvesthub_mobile/data/repos/work_tasks_repo.dart';
import 'package:harvesthub_mobile/data/drift/app_database.dart';

class TasksListScreen extends HookConsumerWidget {
  const TasksListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repo = ref.watch(workTasksRepoProvider);
    // Tabs: Task List (all), Completed Task (status: Complete), Incomplete Task (isCompleted: false)
    const tabs = ['Task List', 'Completed Task', 'Incomplete Task'];
    final tabController = useTabController(initialLength: tabs.length);
    final colorScheme = Theme.of(context).colorScheme;
    final baseIndicator = colorScheme.primary;
    final visibleIndicatorColor =
        baseIndicator.computeLuminance() > 0.8 ? colorScheme.secondary : baseIndicator;

    return DefaultTabController(
      length: tabs.length,
      child: AppScaffold(
      title: 'Tasks',
      currentIndex: 0,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(48),
        child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
          bottom: BorderSide(color: Theme.of(context).dividerColor, width: 1),
          ),
        ),
        child: TabBar(
          controller: tabController,
          labelColor: Theme.of(context).colorScheme.primary,
          unselectedLabelColor: Theme.of(context).colorScheme.onSurfaceVariant,
          indicator: BoxDecoration(
          border: Border(
            bottom: BorderSide(
            color: visibleIndicatorColor,
            width: 2,
            ),
          ),
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: const [
            Tab(
              child: Text(
                'Task List',
                style: TextStyle(color: Colors.black, fontSize: 12),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Tab(
              child: Text(
                'Completed Task',
                style: TextStyle(color: Colors.black, fontSize: 12),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Tab(
              child: Text(
                'Incomplete Task',
                style: TextStyle(color: Colors.black, fontSize: 12),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Create Task',
        onPressed: () => ref.read(appRouterProvider).push('/tasks/new'),
        child: const Icon(Icons.add),
      ),
      child: _TasksTabContent(repo: repo, controller: tabController),
      ),
    );
  }
}

class _TasksTabContent extends HookConsumerWidget {
  final WorkTasksRepo repo;
  final TabController controller;
  const _TasksTabContent({required this.repo, required this.controller});

  String _formatDate(DateTime? dt) {
    if (dt == null) return '-';
    final d = dt.toLocal();
    final two = (int n) => n.toString().padLeft(2, '0');
    return '${d.year}-${two(d.month)}-${two(d.day)} ${two(d.hour)}:${two(d.minute)}';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final query = useState('');

    Widget buildList(Stream<List<WorkTask>> stream, {bool Function(WorkTask)? filter}) {
      return StreamBuilder<List<WorkTask>>(
        stream: stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          var tasks = snapshot.data!;
          if (filter != null) {
            tasks = tasks.where(filter).toList();
          }
          final q = query.value.trim().toLowerCase();
          if (q.isNotEmpty) {
            tasks = tasks.where((t) {
              final name = (t.taskName ?? '').toLowerCase();
              final type = (t.workTaskTypeCode).toLowerCase();
              final status = (t.workTaskStatusCode).toLowerCase();
              return name.contains(q) || type.contains(q) || status.contains(q);
            }).toList();
          }
          if (tasks.isEmpty) return const Center(child: Text('No tasks'));
          return RefreshIndicator(
            onRefresh: () async {
              await Future<void>.delayed(const Duration(milliseconds: 300));
            },
            child: ListView.separated(
              itemCount: tasks.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final t = tasks[index];
                final overdue = (t.dueDate != null && t.dueDate!.isBefore(DateTime.now()) && !t.isCompleted && !t.isCancelled);
                final statusLabel = t.isCancelled ? 'Cancelled' : t.workTaskStatusCode;
                final statusColor = t.isCancelled
                    ? Colors.red
                    : Theme.of(context).colorScheme.primary;
                return ListTile(
                  leading: Icon(
                    overdue ? Icons.error_outline : Icons.task_outlined,
                    color: overdue ? Colors.red : Theme.of(context).colorScheme.primary,
                  ),
                  title: Row(
                    children: [
                      Expanded(child: Text(t.taskName?.isNotEmpty == true ? t.taskName! : t.workTaskTypeCode,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: statusColor.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          statusLabel,
                          style: TextStyle(
                            color: statusColor,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ],
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      Text('Type: ${t.workTaskTypeCode} • Field: ${t.farmFieldId}'),
                      const SizedBox(height: 2),
                      Text('Due: ${_formatDate(t.dueDate)}${overdue ? ' (Overdue)' : ''}'),
                    ],
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => ref.read(appRouterProvider).push('/tasks/${t.workTaskId}'),
                );
              },
            ),
          );
        },
      );
    }

    return Padding(
      padding: const EdgeInsets.only(top: 12, left: 12, right: 12, bottom: 8),
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Filter by name, type, or status',
              border: OutlineInputBorder(),
              isDense: true,
            ),
            onChanged: (v) => query.value = v,
          ),
          const SizedBox(height: 12),
          Expanded(
            child: TabBarView(controller: controller, children: [
              // Task List: all tasks
              buildList(repo.watchAll()),
              // Completed Task: status Complete or cancelled
              buildList(
                repo.watchAll(),
                filter: (t) => t.workTaskStatusCode == kStatusComplete || t.isCancelled,
              ),
              // Incomplete Task: not Complete and not cancelled
              buildList(
                repo.watchAll(),
                filter: (t) => t.workTaskStatusCode != kStatusComplete && !t.isCancelled,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
