import 'package:flutter/material.dart';
import 'package:harvesthub_mobile/app/widgets/harvesthub_app_bar.dart';
import 'package:harvesthub_mobile/data/drift/app_database.dart';
import 'package:harvesthub_mobile/data/repos/crops_repo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CropsListScreen extends HookConsumerWidget {
  const CropsListScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repo = ref.watch(cropsRepoProvider);
    return Scaffold(
      appBar: const HarvestHubAppBar(title: 'Crops'),
      body: SafeArea(
        child: StreamBuilder<List<Crop>>(
          stream: repo.watchAll(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
            final crops = snapshot.data!;
            if (crops.isEmpty) return const Center(child: Text('No crops'));
            return ListView.builder(
              itemCount: crops.length,
              itemBuilder: (context, index) {
                final c = crops[index];
                return ListTile(
                  title: Text(c.cropCode),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
