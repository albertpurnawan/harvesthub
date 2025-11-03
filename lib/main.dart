import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app/router/app_router.dart';
import 'app/theme/app_theme.dart';
import 'data/seed_dev_data.dart';
import 'app/providers/global_providers.dart';
import 'data/drift/app_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final db = AppDatabase();
  final sites = await (db.select(db.farmSites)).get();
  if (sites.isEmpty) {
    await seedDevData(db);
  }
  runApp(ProviderScope(
    overrides: [
      databaseProvider.overrideWithValue(db),
    ],
    child: const HarvestHubApp(),
  ));
}

class HarvestHubApp extends ConsumerWidget {
  const HarvestHubApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final router = ref.watch(appRouterProvider);
    return MaterialApp.router(
      useInheritedMediaQuery: true,
      title: 'HarvestHub',
      themeMode: theme.mode,
      theme: theme.light,
      darkTheme: theme.dark,
      routerConfig: router,
    );
  }
}
