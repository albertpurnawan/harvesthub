import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../design/design_tokens.dart';
import '../../app/router/app_router.dart';
import '../../app/providers/global_providers.dart';

class HarvestHubAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final String title;
  final PreferredSizeWidget? bottom;
  const HarvestHubAppBar({super.key, this.title = 'HarvestHub', this.bottom});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0));

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.read(appRouterProvider);
    final loggedIn = ref.watch(sessionUserIdProvider) != null;
    return AppBar(
      backgroundColor: AppColors.primary,
      elevation: 2,
      titleSpacing: 0,
      bottom: bottom,
      title: Row(
        children: [
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () => ref.read(appRouterProvider).go('/tasks'),
            child: Image.asset('lib/assets/logo.png', height: 28),
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ],
      ),
      iconTheme: const IconThemeData(color: Colors.white),
      leading: Navigator.canPop(context)
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                if (router.canPop()) {
                  router.pop();
                } else {
                  Navigator.maybePop(context);
                }
              },
            )
          : null,
      actions: loggedIn && (title == 'Farm Sites' || title == 'Tasks')
          ? [
              IconButton(
                icon: const Icon(Icons.account_circle),
                onPressed: () => router.push('/profile'),
                tooltip: 'Profile',
              ),
            ]
          : null,
    );
  }
}
