import 'package:flutter/material.dart';
import 'package:harvesthub_mobile/app/providers/global_providers.dart';
import 'package:harvesthub_mobile/features/auth/controllers/auth_controller.dart';
import '../../app/router/app_router.dart';
import 'package:harvesthub_mobile/app/widgets/harvesthub_app_bar.dart';
import 'package:harvesthub_mobile/data/drift/app_database.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileScreen extends HookConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(databaseProvider);
    final usersDao = UsersDao(db);
    final userId = ref.watch(sessionUserIdProvider);
    return Scaffold(
      appBar: const HarvestHubAppBar(title: 'Profile'),
      body: SafeArea(
        child: FutureBuilder<User?>(
          future: userId == null ? Future.value(null) : (usersDao.select(usersDao.users)..where((t) => t.userId.equals(userId))).getSingleOrNull(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Center(child: Text('No user'));
            final u = snapshot.data!;
            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                ListTile(title: const Text('Given Name'), subtitle: Text(u.userGivenName ?? '-')),
                ListTile(title: const Text('Username'), subtitle: Text(u.username)),
                ListTile(title: const Text('Email'), subtitle: Text(u.userEmailAddress ?? '-')),
                ListTile(title: const Text('Farm Site ID'), subtitle: Text('${u.farmSiteId ?? '-'}')),
                const SizedBox(height: 24),
                FilledButton.icon(
                  onPressed: () async {
                    // Read router before awaiting to avoid using ref after dispose
                    final router = ref.read(appRouterProvider);
                    await ref.read(authControllerProvider.notifier).logout();
                    if (!context.mounted) return;
                    router.go('/login');
                  },
                  icon: const Icon(Icons.logout),
                  label: const Text('Logout'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
