import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../app/router/app_router.dart';
import '../design/design_tokens.dart';
import 'harvesthub_app_bar.dart';

class AppScaffold extends ConsumerWidget {
  final String title;
  final Widget child;
  final int currentIndex;
  final PreferredSizeWidget? bottom;
  final Widget? floatingActionButton;

  const AppScaffold({
    super.key,
    required this.title,
    required this.child,
    required this.currentIndex,
    this.bottom,
    this.floatingActionButton,
  });

  void _onSelect(WidgetRef ref, int index) {
    final router = ref.read(appRouterProvider);
    if (index == 0) {
      router.go('/tasks');
    } else {
      router.go('/sites');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isWide = MediaQuery.of(context).size.width >= 900;
    final isDesktopLike = isWide || kIsWeb;

    if (isDesktopLike) {
      return Scaffold(
        appBar: HarvestHubAppBar(title: title, bottom: bottom),
        body: Row(
          children: [
            NavigationRail(
              selectedIndex: currentIndex,
              backgroundColor: AppColors.primary.withOpacity(0.06),
              onDestinationSelected: (i) => _onSelect(ref, i),
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.asset('lib/assets/logo.png', height: 32),
                    const SizedBox(width: 8),
                    const Text('HarvestHub', style: TextStyle(fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.task_outlined),
                  selectedIcon: Icon(Icons.task),
                  label: Text('Task'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.landscape_outlined),
                  selectedIcon: Icon(Icons.landscape),
                  label: Text('Farm Field'),
                ),
              ],
            ),
            const VerticalDivider(width: 1),
            Expanded(child: SafeArea(child: child)),
          ],
        ),
        floatingActionButton: floatingActionButton,
      );
    }

    return Scaffold(
      appBar: HarvestHubAppBar(title: title, bottom: bottom),
      body: SafeArea(child: child),
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          border: Border(top: BorderSide(color: Theme.of(context).dividerColor, width: 1)),
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (i) => _onSelect(ref, i),
          selectedItemColor: AppColors.primary,
          unselectedItemColor: Theme.of(context).colorScheme.onSurfaceVariant,
          backgroundColor: Colors.transparent,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.task_outlined), label: 'Task'),
            BottomNavigationBarItem(icon: Icon(Icons.landscape_outlined), label: 'Farm Field'),
          ],
        ),
      ),
    );
  }
}
