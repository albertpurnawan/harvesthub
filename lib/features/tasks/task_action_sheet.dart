import 'package:flutter/material.dart';
import 'package:harvesthub_mobile/data/drift/app_database.dart';
import 'package:harvesthub_mobile/data/repos/work_tasks_repo.dart';
import 'package:harvesthub_mobile/app/providers/global_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TaskActionSheet extends HookConsumerWidget {
  final WorkTask task;
  const TaskActionSheet({super.key, required this.task});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repo = ref.watch(workTasksRepoProvider);
    final isPaused = !task.isStarted && task.workTaskStatusCode != 'Complete' && !task.isCancelled;
    return SafeArea(
      child: Wrap(
        children: [
          ListTile(
            leading: Icon(isPaused ? Icons.play_arrow : Icons.pause),
            title: Text(isPaused ? 'Start' : 'Pause'),
            onTap: () async {
              bool ok = false;
              try {
                // Default to session user and now as action time
                final actorUserId = ref.read(sessionUserIdProvider);
                final now = DateTime.now();
                if (isPaused) {
                  ok = await repo.continueTask(task, actionTime: now, actorUserId: actorUserId);
                } else {
                  ok = await repo.pauseTask(task, actionTime: now, actorUserId: actorUserId);
                }
              } catch (_) {}
              if (!context.mounted) return;
              Navigator.pop(context);
              await showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text(ok ? 'Success' : 'Failed'),
                  content: Text(isPaused
                      ? (ok ? 'Task started successfully.' : 'Failed to start task.')
                      : (ok ? 'Task paused successfully.' : 'Failed to pause task.')),
                  actions: [
                    TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK')),
                  ],
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.cancel),
            title: const Text('Cancel Task'),
            onTap: () async {
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
                final actorUserId = ref.read(sessionUserIdProvider);
                ok = await repo.cancelTask(task, actionTime: DateTime.now(), actorUserId: actorUserId);
              } catch (_) {}
              if (!context.mounted) return;
              Navigator.pop(context);
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
          ListTile(
            leading: const Icon(Icons.check),
            title: const Text('Complete'),
            onTap: () async {
              bool ok = false;
              try {
                final actorUserId = ref.read(sessionUserIdProvider);
                ok = await repo.completeTask(task, actionTime: DateTime.now(), actorUserId: actorUserId);
              } catch (_) {}
              if (!context.mounted) return;
              Navigator.pop(context);
              await showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text(ok ? 'Success' : 'Failed'),
                  content: Text(ok ? 'Task completed successfully.' : 'Failed to complete task.'),
                  actions: [
                    TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK')),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
