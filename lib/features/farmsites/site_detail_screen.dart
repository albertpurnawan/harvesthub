import 'package:flutter/material.dart';
import 'package:harvesthub_mobile/app/providers/global_providers.dart';
import 'package:harvesthub_mobile/app/widgets/harvesthub_app_bar.dart';
import 'package:harvesthub_mobile/data/drift/app_database.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:drift/drift.dart' show Value;

class SiteDetailScreen extends HookConsumerWidget {
  final int siteId;
  const SiteDetailScreen({super.key, required this.siteId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(databaseProvider);
    final cropsFuture = (db.select(db.crops)).get();
    final siteFuture = (db.select(db.farmSites)..where((t) => t.farmSiteId.equals(siteId))).getSingle();
    final nameController = TextEditingController();
    int? defaultCropId;
    return Scaffold(
      appBar: const HarvestHubAppBar(title: 'Site Detail'),
      body: SafeArea(
        child: FutureBuilder(
          future: Future.wait([siteFuture, cropsFuture]),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
            final site = snapshot.data![0] as FarmSite;
            final crops = snapshot.data![1] as List<Crop>;
            nameController.text = site.farmSiteName;
            defaultCropId = site.defaultPrimaryCropId;
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(children: [
                TextField(controller: nameController, decoration: const InputDecoration(labelText: 'Site Name')),
                const SizedBox(height: 12),
                DropdownButtonFormField<int>(
                  initialValue: defaultCropId,
                  items: crops.map((c) => DropdownMenuItem(value: c.cropId, child: Text(c.cropCode))).toList(),
                  onChanged: (v) => defaultCropId = v,
                  decoration: const InputDecoration(labelText: 'Default Primary Crop'),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () async {
                    final updated = site.copyWith(
                      farmSiteName: nameController.text,
                      defaultPrimaryCropId: Value(defaultCropId),
                    );
                    await (db.update(db.farmSites)).replace(updated);
                    if (context.mounted) Navigator.pop(context);
                  },
                  child: const Text('Save'),
                ),
              ]),
            );
          },
        ),
      ),
    );
  }
}
