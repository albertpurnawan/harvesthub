import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:harvesthub_mobile/app/providers/global_providers.dart';
import 'package:harvesthub_mobile/app/widgets/harvesthub_app_bar.dart';
import 'package:harvesthub_mobile/data/drift/app_database.dart';
import 'package:harvesthub_mobile/data/repos/work_tasks_repo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:file_selector/file_selector.dart';

class TaskFormScreen extends HookConsumerWidget {
  const TaskFormScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(databaseProvider);
    final fieldsFuture = (db.select(db.farmFields)).get();
    final typesFuture = (db.select(db.workTaskTypes)).get();
    final fieldId = useState<int?>(null);
    final typeCode = useState<String?>(null);
    final dueDate = useState<DateTime?>(null);
    final nameController = useTextEditingController();
    final instructionController = useTextEditingController();
    final attachmentBase64 = useState<String?>(null);
    final attachmentName = useState<String?>(null);
    final dueDateController = useTextEditingController();
    final formKey = useMemoized(GlobalKey<FormState>.new);
    final repo = ref.watch(workTasksRepoProvider);

    // Note: Avoid accessing inherited widgets in init hooks.
    return Scaffold(
      appBar: const HarvestHubAppBar(title: 'New Task'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: FutureBuilder(
            future: Future.wait([fieldsFuture, typesFuture]),
            builder: (context, snapshot) {
            if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
            final fields = snapshot.data![0] as List<FarmField>;
            final types = snapshot.data![1] as List<WorkTaskType>;
            return Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 520),
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                    child: Form(
                      key: formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: 12),
                            TextFormField(
                              controller: nameController,
                              decoration: const InputDecoration(
                                labelText: 'Task Name',
                                prefixIcon: Icon(Icons.title_outlined),
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 12),
                            DropdownButtonFormField<String>(
                              value: typeCode.value,
                              items: types
                                  .map((t) => DropdownMenuItem(value: t.workTaskTypeCode.toString(), child: Text(t.workTaskTypeCode.toString())))
                                  .toList(),
                              onChanged: (v) => typeCode.value = v,
                              decoration: const InputDecoration(labelText: 'Task Type', prefixIcon: Icon(Icons.category_outlined), border: OutlineInputBorder()),
                              validator: (v) => v == null || v.isEmpty ? 'Task type is required' : null,
                            ),
                            const SizedBox(height: 12),
                            DropdownButtonFormField<int>(
                              value: fieldId.value,
                              items: fields
                                  .map((f) => DropdownMenuItem(value: f.farmFieldId, child: Text(f.farmFieldName)))
                                  .toList(),
                              onChanged: (v) => fieldId.value = v,
                              decoration: const InputDecoration(labelText: 'Field', prefixIcon: Icon(Icons.landscape_outlined), border: OutlineInputBorder()),
                              validator: (v) => v == null ? 'Field is required' : null,
                            ),
                            const SizedBox(height: 12),
                            TextFormField(
                              controller: dueDateController,
                              readOnly: true,
                              onTap: () async {
                                final picked = await showDatePicker(
                                  context: context,
                                  firstDate: DateTime(2020),
                                  lastDate: DateTime(2100),
                                  initialDate: dueDate.value ?? DateTime.now(),
                                );
                                if (picked != null) {
                                  dueDate.value = picked;
                                  dueDateController.text =
                                      MaterialLocalizations.of(context).formatMediumDate(picked);
                                }
                              },
                              decoration: const InputDecoration(
                                labelText: 'Due by',
                                prefixIcon: Icon(Icons.schedule_outlined),
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 12),
                            TextFormField(
                              controller: instructionController,
                              maxLines: 3,
                              decoration: const InputDecoration(
                                labelText: 'Instruction',
                                alignLabelWithHint: true,
                                prefixIcon: Icon(Icons.description_outlined),
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                ElevatedButton.icon(
                                  onPressed: () async {
                                    try {
                                      final XFile? file = await openFile();
                                      if (file != null) {
                                        attachmentName.value = file.name;
                                        final bytes = await file.readAsBytes();
                                        attachmentBase64.value = base64Encode(bytes);
                                      }
                                    } catch (e) {
                                      if (context.mounted) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text('Gagal membuka file picker: $e')),
                                        );
                                      }
                                    }
                                  },
                                  icon: const Icon(Icons.upload_file),
                                  label: const Text('Upload File'),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    attachmentName.value == null
                                        ? 'No file selected'
                                        : 'Selected: ${attachmentName.value}',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'Attachment will be saved as Base64 string',
                              style: TextStyle(fontSize: 12, color: Colors.black54),
                            ),
                            const SizedBox(height: 20),
                            FilledButton(
                              onPressed: () async {
                                final valid = formKey.currentState?.validate() ?? false;
                                if (!valid) return;
                                await repo.addTask(
                                  fieldId: fieldId.value!,
                                  typeCode: typeCode.value!,
                                  dueDate: dueDate.value ?? DateTime.now(),
                                  createdUserId: null,
                                  modifiedUserId: 1,
                                  taskName: nameController.text.isEmpty ? null : nameController.text,
                                  instruction: instructionController.text.isEmpty ? null : instructionController.text,
                                  attachmentUri: attachmentBase64.value,
                                );
                                if (context.mounted) Navigator.pop(context);
                              },
                              child: const Text('Save Task'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ));
  }
}
