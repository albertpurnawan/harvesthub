import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:harvesthub_mobile/app/design/design_tokens.dart';
import 'package:harvesthub_mobile/app/providers/global_providers.dart';
import 'package:harvesthub_mobile/app/widgets/harvesthub_app_bar.dart';
import 'package:harvesthub_mobile/data/drift/app_database.dart';
import 'package:harvesthub_mobile/app/router/app_router.dart';
import 'package:harvesthub_mobile/data/repos/work_tasks_repo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_filex/open_filex.dart';

final selectedActorByTaskProvider = StateProvider.autoDispose.family<int?, int>((ref, taskId) {
  final sessionUser = ref.read(sessionUserIdProvider);
  return sessionUser;
});

final selectedActionTimeByTaskProvider = StateProvider.autoDispose.family<DateTime, int>((ref, taskId) {
  return DateTime.now();
});

class TaskDetailScreen extends ConsumerWidget {
  final int taskId;
  const TaskDetailScreen({super.key, required this.taskId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(databaseProvider);
    final repo = ref.watch(workTasksRepoProvider);
    final usersDao = UsersDao(db);
    final sessionUser = ref.watch(sessionUserIdProvider);
    final selectedUser = ref.watch(selectedActorByTaskProvider(taskId));
    final selectedDateTime = ref.watch(selectedActionTimeByTaskProvider(taskId));
    return Scaffold(
      appBar: const HarvestHubAppBar(title: 'Task Detail'),
      body: SafeArea(
        child: StreamBuilder<List<WorkTask>>(
          stream: (db.select(db.workTasks)..where((t) => t.workTaskId.equals(taskId))).watch(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
            if (snapshot.data == null || snapshot.data!.isEmpty) {
              return const Center(child: Text('Task not found'));
            }
            final t = snapshot.data!.first;

            Future<void> previewAttachment() async {
              try {
                final raw = t.attachmentUri;
                if (raw == null || raw.isEmpty) return;
                final base64Str = raw.contains(',') ? raw.split(',').last : raw;
                final bytes = base64Decode(base64Str);
                String ext = 'bin';
                if (bytes.length >= 4) {
                  final b0 = bytes[0];
                  final b1 = bytes[1];
                  final b2 = bytes[2];
                  final b3 = bytes[3];
                  final header = String.fromCharCodes(bytes.take(4));
                  if (header.startsWith('%PDF')) {
                    ext = 'pdf';
                  } else if (b0 == 0x89 && b1 == 0x50 && b2 == 0x4E && b3 == 0x47) {
                    ext = 'png';
                  } else if (b0 == 0xFF && b1 == 0xD8 && b2 == 0xFF) {
                    ext = 'jpg';
                  } else if (header.startsWith('GIF8')) {
                    ext = 'gif';
                  }
                }
                final dir = await getTemporaryDirectory();
                final file = File('${dir.path}/task_${t.workTaskId}_attachment.$ext');
                await file.writeAsBytes(bytes, flush: true);
                final result = await OpenFilex.open(file.path);
                if (result.message != 'done' && context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Preview failed: ${result.message}')),
                  );
                }
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error previewing attachment: $e')),
                  );
                }
              }
            }

            return ListView(
              padding: const EdgeInsets.all(16),
                children: [
                ListTile(title: const Text('Name'), subtitle: Text(t.taskName ?? '-')),
                ListTile(title: const Text('Type'), subtitle: Text(t.workTaskTypeCode)),
                ListTile(title: const Text('Status'), subtitle: Text(t.workTaskStatusCode)),
                ListTile(title: const Text('Due'), subtitle: Text(t.dueDate?.toIso8601String() ?? '-')),
                if ((t.instruction ?? '').isNotEmpty) ListTile(title: const Text('Instruction'), subtitle: Text(t.instruction!)),
                if ((t.attachmentUri ?? '').isNotEmpty)
                  ListTile(
                    title: const Text('Attachment'),
                    subtitle: const Text('An attachment is available'),
                    trailing: ElevatedButton.icon(
                      icon: const Icon(Icons.visibility),
                      label: const Text('Preview'),
                      onPressed: previewAttachment,
                    ),
                  ),
                const SizedBox(height: 12),
                
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: StreamBuilder<List<WorkTask>>(
        stream: (db.select(db.workTasks)..where((t) => t.workTaskId.equals(taskId))).watch(),
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty) {
        return const SizedBox.shrink();
          }
          final t = snapshot.data!.first;
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                label: const Text('Open Task Actions', style: TextStyle(color: Colors.white)),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(AppColors.primary),
                  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 16)),
                ),
                icon: const Icon(Icons.open_in_new, color: Colors.white),
                onPressed: () => ref.read(appRouterProvider).push('/tasks/${t.workTaskId}/actions'),
              ),
            ),
          );
        },
      ),  
    );
  }
}
