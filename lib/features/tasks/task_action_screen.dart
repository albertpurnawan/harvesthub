import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:harvesthub_mobile/app/widgets/harvesthub_app_bar.dart';
import 'package:harvesthub_mobile/app/providers/global_providers.dart';
import 'package:harvesthub_mobile/data/drift/app_database.dart';
import 'package:harvesthub_mobile/data/repos/work_tasks_repo.dart';

final taskActionSelectedActorProvider = StateProvider.autoDispose.family<int?, int>((ref, taskId) {
  final sessionUser = ref.read(sessionUserIdProvider);
  return sessionUser;
});

final taskActionSelectedTimeProvider = StateProvider.autoDispose.family<DateTime, int>((ref, taskId) {
  return DateTime.now();
});

class TaskActionScreen extends ConsumerWidget {
  final int taskId;
  const TaskActionScreen({super.key, required this.taskId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(databaseProvider);
    final repo = ref.watch(workTasksRepoProvider);
    final usersDao = UsersDao(db);
    final sessionUser = ref.watch(sessionUserIdProvider);
    final selectedUser = ref.watch(taskActionSelectedActorProvider(taskId));
    final selectedDateTime = ref.watch(taskActionSelectedTimeProvider(taskId));

    ButtonStyle primaryBtn(BuildContext ctx) => ElevatedButton.styleFrom(
          backgroundColor: Theme.of(ctx).colorScheme.primary,
          foregroundColor: Theme.of(ctx).colorScheme.onPrimary,
        );

    return Scaffold(
      appBar: const HarvestHubAppBar(title: 'Task Actions'),
      body: SafeArea(
        child: StreamBuilder<List<WorkTask>>(
          stream: (db.select(db.workTasks)..where((t) => t.workTaskId.equals(taskId))).watch(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
            if (snapshot.data == null || snapshot.data!.isEmpty) {
              return const Center(child: Text('Task not found'));
            }
            final t = snapshot.data!.first;
            final isFinished = t.isCompleted || t.isCancelled;
            final shouldStart = (!t.isStarted || t.isCompleted) && !t.isCancelled;

            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                StreamBuilder<List<User>>(
                  stream: usersDao.watchAllUsers(),
                  builder: (context, snap) {
                    final users = snap.data ?? const <User>[];
                    final seen = <int>{};
                    final uniqueUsers = <User>[];
                    for (final u in users) {
                      if (!seen.contains(u.userId)) {
                        seen.add(u.userId);
                        uniqueUsers.add(u);
                      }
                    }
                    // Exclude the currently logged-in user from the list (use 'Myself' instead)
                    final filteredUsers = uniqueUsers.where((u) => u.userId != sessionUser).toList();
                    final availableIds = filteredUsers.map((u) => u.userId).toSet();
                    // If selectedUser equals session user, prefer 'Myself' (null)
                    final currentValue = (selectedUser != null && selectedUser != sessionUser && availableIds.contains(selectedUser))
                        ? selectedUser
                        : null;
                    return Row(
                      children: [
                        Expanded(
                          child: DropdownButtonFormField<int?>(
                            value: currentValue,
                            decoration: const InputDecoration(labelText: 'On behalf of'),
                            items: [
                              const DropdownMenuItem<int?>(value: null, child: Text('Myself')),
                              ...filteredUsers.map((u) => DropdownMenuItem<int?>(
                                    value: u.userId,
                                    child: Text(u.userGivenName ?? 'User ${u.userId}'),
                                  )),
                            ],
                            onChanged: isFinished
                                ? null
                                : (v) => ref.read(taskActionSelectedActorProvider(taskId).notifier).state = v,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: InkWell(
                            onTap: isFinished
                                ? null
                                : () async {
                                    final now = DateTime.now();
                                    final pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: selectedDateTime,
                                      firstDate: DateTime(now.year - 5),
                                      lastDate: DateTime(now.year + 5),
                                    );
                                    if (pickedDate == null) return;
                                    final pickedTime = await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.fromDateTime(selectedDateTime),
                                    );
                                    if (pickedTime == null) return;
                                    ref.read(taskActionSelectedTimeProvider(taskId).notifier).state = DateTime(
                                      pickedDate.year,
                                      pickedDate.month,
                                      pickedDate.day,
                                      pickedTime.hour,
                                      pickedTime.minute,
                                    );
                                  },
                            child: InputDecorator(
                              decoration: const InputDecoration(labelText: 'Action time/date'),
                              child: Text(
                                '${selectedDateTime.year}-${selectedDateTime.month.toString().padLeft(2, '0')}-${selectedDateTime.day.toString().padLeft(2, '0')} '
                                '${selectedDateTime.hour.toString().padLeft(2, '0')}:${selectedDateTime.minute.toString().padLeft(2, '0')}',
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 20),

                Wrap(spacing: 12, runSpacing: 12, children: [
                  ElevatedButton.icon(
                    style: primaryBtn(context),
                    icon: Icon(shouldStart ? Icons.play_arrow : Icons.pause),
                    label: Text(shouldStart ? 'Start' : 'Pause'),
                    onPressed: isFinished
                        ? null
                        : () async {
                            bool ok = false;
                            try {
                              if (shouldStart) {
                                ok = await repo.continueTask(t, actionTime: selectedDateTime, actorUserId: selectedUser ?? sessionUser);
                              } else {
                                ok = await repo.pauseTask(t, actionTime: selectedDateTime, actorUserId: selectedUser ?? sessionUser);
                              }
                            } catch (_) {}
                            if (!context.mounted) return;
                            await showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                title: Text(ok ? 'Success' : 'Failed'),
                                content: Text(shouldStart
                                    ? (ok ? 'Task started successfully.' : 'Failed to start task.')
                                    : (ok ? 'Task paused successfully.' : 'Failed to pause task.')),
                                actions: [
                                  TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK')),
                                ],
                              ),
                            );
                          },
                  ),
                  ElevatedButton.icon(
                    style: primaryBtn(context),
                    icon: const Icon(Icons.check),
                    label: const Text('Complete'),
                    onPressed: (t.isCompleted || t.isCancelled)
                        ? null
                        : () async {
                            bool ok = false;
                            try {
                              ok = await repo.completeTask(t, actionTime: selectedDateTime, actorUserId: selectedUser ?? sessionUser);
                            } catch (_) {}
                            if (!context.mounted) return;
                            await showDialog(
                              context: context,
                              builder: (_) => const AlertDialog(
                                title: Text('Success'),
                                content: Text('Task completed successfully.'),
                              ),
                            );
                          },
                  ),
                  ElevatedButton.icon(
                    style: primaryBtn(context),
                    icon: const Icon(Icons.cancel),
                    label: const Text('Cancel Task'),
                    onPressed: (t.isCompleted || t.isCancelled)
                        ? null
                        : () async {
                            final confirm = await showDialog<bool>(
                              context: context,
                              builder: (_) => AlertDialog(
                                title: const Text('Cancel Task'),
                                content: const Text('Are you sure you want to cancel this task?'),
                                actions: [
                                  TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('No')),
                                  TextButton(onPressed: () => Navigator.pop(context, true), child: const Text('Yes')),
                                ],
                              ),
                            );
                            if (confirm != true) return;
                            bool ok = false;
                            try {
                              ok = await repo.cancelTask(t, actionTime: selectedDateTime, actorUserId: selectedUser ?? sessionUser);
                            } catch (_) {}
                            if (!context.mounted) return;
                            await showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                title: Text(ok ? 'Success' : 'Failed'),
                                content: Text(ok ? 'Task cancelled successfully.' : 'Failed to cancel task.'),
                                actions: [
                                  TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK')),
                                ],
                              ),
                            );
                          },
                  ),
                ]),
              ],
            );
          },
        ),
      ),
    );
  }
}
