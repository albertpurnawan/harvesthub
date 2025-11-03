import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:harvesthub_mobile/app/widgets/harvesthub_app_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../providers/global_providers.dart';
import '../../features/auth/login_screen.dart';
import '../../features/farmsites/sites_list_screen.dart';
import '../../features/farmfields/fields_list_screen.dart';
import '../../features/farmsites/site_detail_screen.dart';
import '../../features/farmfields/field_form_screen.dart';
import '../../features/tasks/tasks_list_screen.dart';
import '../../features/tasks/task_form_screen.dart';
import '../../features/tasks/task_detail_screen.dart';
import '../../features/tasks/task_action_screen.dart';
import '../../features/profile/profile_screen.dart';
import '../../features/crops/crops_list_screen.dart';
import '../widgets/harvesthub_app_bar.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final session = ref.watch(sessionUserIdProvider);
  final refresh = ValueNotifier<int?>(session);
  ref.listen<int?>(sessionUserIdProvider, (prev, next) {
    refresh.value = next;
  });
  final router = GoRouter(
    refreshListenable: refresh,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/',
        redirect: (context, state) {
          final loggedIn = ref.read(sessionUserIdProvider) != null;
          return loggedIn ? '/tasks' : '/login';
        },
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/sites',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const SitesListScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final tween = Tween<Offset>(begin: const Offset(0.1, 0), end: Offset.zero)
                .chain(CurveTween(curve: Curves.easeOut));
            return SlideTransition(position: animation.drive(tween), child: child);
          },
        ),
      ),
      GoRoute(
        path: '/sites/:id/fields',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return FieldsListScreen(siteId: int.parse(id));
        },
      ),
      GoRoute(
        path: '/sites/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return SiteDetailScreen(siteId: int.parse(id));
        },
      ),
      GoRoute(
        path: '/fields/new',
        builder: (context, state) => const FieldFormScreen(),
      ),
      GoRoute(
        path: '/tasks',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const TasksListScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final tween = Tween<Offset>(begin: const Offset(0.1, 0), end: Offset.zero)
                .chain(CurveTween(curve: Curves.easeOut));
            return SlideTransition(position: animation.drive(tween), child: child);
          },
        ),
      ),
      GoRoute(
        path: '/tasks/new',
        builder: (context, state) => const TaskFormScreen(),
      ),
      GoRoute(
        path: '/tasks/:id',
        builder: (context, state) {
          final id = int.parse(state.pathParameters['id']!);
          return TaskDetailScreen(taskId: id);
        },
      ),
      GoRoute(
        path: '/tasks/:id/actions',
        builder: (context, state) {
          final id = int.parse(state.pathParameters['id']!);
          return TaskActionScreen(taskId: id);
        },
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: '/crops',
        builder: (context, state) => const CropsListScreen(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      appBar: const HarvestHubAppBar(title: 'Router Error'),
      body: const SafeArea(
        child: Center(child: Text('Unknown routing error')),
      ),
    ),
    redirect: (context, state) {
      // Avoid reading providers synchronously during redirect callbacks.
      final loggedIn = refresh.value != null;
      final loggingIn = state.matchedLocation == '/login';
      if (!loggedIn && !loggingIn) return '/login';
      if (loggedIn && loggingIn) return '/tasks';
      return null;
    },
    initialLocation: '/login',
  );
  return router;
});
