import 'package:flutter/material.dart';
import 'package:harvesthub_mobile/app/widgets/app_scaffold.dart';
import 'package:harvesthub_mobile/data/drift/app_database.dart';
import 'package:harvesthub_mobile/data/repos/farm_fields_repo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'field_form_screen.dart';

class FieldsListScreen extends HookConsumerWidget {
  final int siteId;
  const FieldsListScreen({super.key, required this.siteId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repo = ref.watch(farmFieldsRepoProvider);
    return AppScaffold(
      title: 'Fields',
      currentIndex: 1,
      floatingActionButton: FloatingActionButton(
        tooltip: 'Create Field',
        onPressed: () async {
          await Navigator.push(context, MaterialPageRoute(builder: (_) => FieldFormScreen(siteId: siteId)));
        },
        child: const Icon(Icons.add),
      ),
      child: StreamBuilder<List<FarmField>>(
        stream: repo.watchBySite(siteId),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
          final fields = snapshot.data!;
          if (fields.isEmpty) return const Center(child: Text('No fields'));
          return ListView.builder(
            itemCount: fields.length,
            itemBuilder: (context, index) {
              final field = fields[index];
              return ListTile(
                title: Text(field.farmFieldName),
                subtitle: Text(field.farmFieldCode ?? ''),
              );
            },
          );
        },
      ),
    );
  }
}
