import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../app/router/app_router.dart';
import 'package:harvesthub_mobile/app/widgets/app_scaffold.dart';
import 'package:harvesthub_mobile/data/drift/app_database.dart';
import 'package:harvesthub_mobile/data/repos/farm_sites_repo.dart';
import 'package:harvesthub_mobile/app/providers/global_providers.dart';

class SitesListScreen extends HookConsumerWidget {
  const SitesListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repo = ref.watch(farmSitesRepoProvider);
    final searchController = TextEditingController();
    useListenable(searchController);

    String formatDate(DateTime? dt) {
      if (dt == null) return '-';
      final d = dt.toLocal();
      String two(int n) => n.toString().padLeft(2, '0');
      return '${d.year}-${two(d.month)}-${two(d.day)} ${two(d.hour)}:${two(d.minute)}';
    }
    return AppScaffold(
      title: 'Farm Sites',
      currentIndex: 1,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final name = await _prompt(context, 'New site name');
          if (name != null && name.isNotEmpty) {
            final userId = ref.read(sessionUserIdProvider);
            // TODO: Replace 1 with a real crop picker if needed
            await repo.addSite(name, defaultCropId: 1, modifiedUserId: userId!);
          }
        },
        child: const Icon(Icons.add),
      ),
      child: StreamBuilder<List<FarmSite>>(
        stream: repo.watchAll(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
          var sites = snapshot.data!;
          final q = searchController.text.trim().toLowerCase();
          if (q.isNotEmpty) {
            sites = sites.where((s) => s.farmSiteName.toLowerCase().contains(q)).toList();
          }
          if (sites.isEmpty) return const Center(child: Text('No sites'));
          return Padding(
            padding: const EdgeInsets.only(top: 12, left: 12, right: 12, bottom: 8),
            child: Column(
              children: [
                TextField(
                  controller: searchController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search sites',
                    border: OutlineInputBorder(),
                    isDense: true,
                  ),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async { await Future<void>.delayed(const Duration(milliseconds: 300)); },
                    child: ListView.separated(
                      itemCount: sites.length,
                      separatorBuilder: (_, __) => const Divider(height: 1),
                      itemBuilder: (context, index) {
                        final site = sites[index];
                        final statusColor = Theme.of(context).colorScheme.primary;
                        return ListTile(
                          leading: Icon(Icons.home_work_outlined, color: statusColor),
                          title: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  site.farmSiteName,
                                  style: const TextStyle(fontWeight: FontWeight.w600),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: statusColor.withOpacity(0.08),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  'Crop: ${site.defaultPrimaryCropId ?? '-'}',
                                  style: TextStyle(color: statusColor, fontSize: 11),
                                ),
                              ),
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 4),
                              Text('Site ID: ${site.farmSiteId}'),
                              const SizedBox(height: 2),
                              Text('Modified: ${formatDate(site.modifiedDate)}'),
                            ],
                          ),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () => ref.read(appRouterProvider).push('/sites/${site.farmSiteId}/fields'),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<String?> _prompt(BuildContext context, String title) async {
    final controller = TextEditingController();
    return showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text('Create Farm Site', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                const SizedBox(height: 12),
                TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    labelText: 'Site name',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.home_work_outlined),
                  ),
                ),
                const SizedBox(height: 12),
                FilledButton(
                  onPressed: () => Navigator.pop(context, controller.text.trim()),
                  child: const Text('Create'),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
