import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:drift/native.dart';
import 'package:harvesthub_mobile/data/drift/app_database.dart';
import 'package:harvesthub_mobile/data/seed_dev_data.dart';
import 'package:harvesthub_mobile/app/providers/global_providers.dart';
import 'package:harvesthub_mobile/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  Future<void> smoothSettle(WidgetTester tester) async {
    await tester.pump(const Duration(milliseconds: 700));
    await tester.pumpAndSettle(const Duration(milliseconds: 250));
  }

  testWidgets('Web-like flow mirrors mobile flow', (WidgetTester tester) async {
    // Ensure predictable surface size to avoid overflow in AppBar rows.
    tester.view.devicePixelRatio = 1.0;
    tester.view.physicalSize = const Size(1400, 900);
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    // Use in-memory SharedPreferences for tests.
    SharedPreferences.setMockInitialValues({});
    // This is a widget test that mirrors the E2E flow.
    // It can run on CI without a real browser/device.
    final db = AppDatabase.forTesting(NativeDatabase.memory());
    // Seed dev data for login and lists
    await seedDevData(db);
    await tester.pumpWidget(ProviderScope(
      overrides: [databaseProvider.overrideWithValue(db)],
      child: const HarvestHubApp(),
    ));
    await tester.pumpAndSettle(const Duration(seconds: 2));

    // Login
    final usernameField = find.bySemanticsLabel('Username');
    final passwordField = find.bySemanticsLabel('Password');
    await tester.tap(usernameField);
    await tester.enterText(usernameField, 'admin');
    await tester.tap(passwordField);
    await tester.enterText(passwordField, 'admin');
    await tester.tap(find.text('Login'));
    await smoothSettle(tester);
    expect(find.text('Tasks'), findsOneWidget);

    // Create Task
    final fabFinder = find.byTooltip('Create Task');
    await tester.ensureVisible(fabFinder);
    await tester.tap(fabFinder, warnIfMissed: false);
    await smoothSettle(tester);
    expect(find.text('New Task'), findsOneWidget);

    await tester.tap(find.widgetWithText(DropdownButtonFormField<String>, 'Task Type'));
    await smoothSettle(tester);
    await tester.tap(find.text('Plant').last);
    await smoothSettle(tester);

    await tester.tap(find.widgetWithText(DropdownButtonFormField<int>, 'Field'));
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.tap(find.text('Field 1').last);
    await tester.pumpAndSettle(const Duration(seconds: 1));

    await tester.enterText(find.bySemanticsLabel('Task Name'), 'Widget Web Task');
    await tester.pump(const Duration(milliseconds: 700));

    final saveFinder = find.text('Save Task');
    await tester.ensureVisible(saveFinder);
    await tester.tap(saveFinder, warnIfMissed: false);
    await smoothSettle(tester);
    expect(find.text('Tasks'), findsOneWidget);

    // Open created task
    final filterBox = find.byType(TextField).first;
    await tester.tap(filterBox);
    await tester.enterText(filterBox, 'Widget Web Task');
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.tapAt(const Offset(10, 100));
    await smoothSettle(tester);

    final taskTile = find.ancestor(of: find.text('Widget Web Task'), matching: find.byType(ListTile)).first;
    await tester.ensureVisible(taskTile);
    await tester.tap(taskTile, warnIfMissed: false);
    await smoothSettle(tester);
    expect(find.text('Task Detail'), findsOneWidget);

    await tester.tap(find.text('Open Task Actions'));
    await smoothSettle(tester);
    expect(find.text('Task Actions'), findsOneWidget);

    // Start / Pause / Start / Complete
    await tester.tap(find.text('Start'), warnIfMissed: false);
    await smoothSettle(tester);
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    await tester.tap(find.text('Pause'), warnIfMissed: false);
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    await tester.tap(find.text('Start'), warnIfMissed: false);
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    await tester.tap(find.text('Complete'));
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.tapAt(const Offset(10, 10));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    final backIcon = find.byIcon(Icons.arrow_back);
    await tester.tap(backIcon);
    await smoothSettle(tester);
    await tester.tap(backIcon);
    await smoothSettle(tester);
    expect(find.text('Tasks'), findsOneWidget);

    // Cancel task flow
    await tester.tap(fabFinder, warnIfMissed: false);
    await smoothSettle(tester);
    await tester.tap(find.widgetWithText(DropdownButtonFormField<String>, 'Task Type'));
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.tap(find.text('Plant').last);
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.tap(find.widgetWithText(DropdownButtonFormField<int>, 'Field'));
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.tap(find.text('Field 1').last);
    await tester.pumpAndSettle(const Duration(seconds: 1));
    final nameField2 = find.bySemanticsLabel('Task Name');
    if (nameField2.evaluate().isNotEmpty) {
      await tester.enterText(nameField2, 'Widget Web Task Cancel');
      await tester.pumpAndSettle(const Duration(seconds: 1));
    }
    await tester.ensureVisible(saveFinder);
    await tester.tap(saveFinder, warnIfMissed: false);
    await tester.pumpAndSettle(const Duration(seconds: 1));
    expect(find.text('Tasks'), findsOneWidget);

    await tester.tap(filterBox);
    await tester.enterText(filterBox, 'Widget Web Task Cancel');
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.tapAt(const Offset(10, 100));
    await smoothSettle(tester);
    final cancelTile = find.ancestor(of: find.text('Widget Web Task Cancel'), matching: find.byType(ListTile)).first;
    await tester.ensureVisible(cancelTile);
    await tester.tap(cancelTile, warnIfMissed: false);
    await tester.pumpAndSettle(const Duration(seconds: 1));
    expect(find.text('Task Detail'), findsOneWidget);
    await tester.tap(find.text('Open Task Actions'));
    await tester.pumpAndSettle(const Duration(seconds: 1));
    expect(find.text('Task Actions'), findsOneWidget);
    await tester.tap(find.text('Cancel Task'));
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.tap(find.text('Yes'));
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    await tester.tap(backIcon);
    await smoothSettle(tester);
    await tester.tap(backIcon);
    await smoothSettle(tester);
    expect(find.text('Tasks'), findsOneWidget);

    // Field creation
    final sitesTabFinder = find.text('Farm Field');
    await tester.ensureVisible(sitesTabFinder);
    await tester.tap(sitesTabFinder, warnIfMissed: false);
    await tester.pumpAndSettle(const Duration(seconds: 1));
    expect(find.text('Farm Sites'), findsOneWidget);

    final siteTile = find.byType(ListTile).first;
    await tester.tap(siteTile);
    await tester.pumpAndSettle(const Duration(seconds: 1));
    expect(find.text('Fields'), findsOneWidget);

    final fieldFab = find.byTooltip('Create Field');
    await tester.ensureVisible(fieldFab);
    await tester.tap(fieldFab, warnIfMissed: false);
    await smoothSettle(tester);
    expect(find.text('Field Form'), findsOneWidget);

    await tester.enterText(find.bySemanticsLabel('Name'), 'FT-Widget Web');
    await tester.enterText(find.bySemanticsLabel('Row width (m)'), '2.5');
    await tester.tap(find.widgetWithText(DropdownButtonFormField<String>, 'Row direction'));
    await smoothSettle(tester);
    await tester.tap(find.text('North-South').last);
    await smoothSettle(tester);
    await tester.tap(find.byTooltip('Pick colour'));
    await smoothSettle(tester);
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    final saveField = find.text('Save Field');
    await tester.ensureVisible(saveField);
    await tester.tap(saveField, warnIfMissed: false);
    await smoothSettle(tester);
    expect(find.byType(ListTile), findsWidgets);
  });
}
