import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:harvesthub_mobile/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  Future<void> smoothSettle(WidgetTester tester) async {
    await tester.pump(const Duration(milliseconds: 700));
    await tester.pumpAndSettle(const Duration(milliseconds: 250));
  }

  testWidgets('Web flow mirrors mobile flow', (WidgetTester tester) async {
    // Only meaningful on web; short-circuit elsewhere to avoid duplicate CI runs.
    if (!kIsWeb) {
      return;
    }

    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 2));

    // Login
    await tester.enterText(find.widgetWithText(TextFormField, 'Username'), 'admin');
    await tester.enterText(find.widgetWithText(TextFormField, 'Password'), 'admin');
    await tester.tap(find.text('Login'));
    await smoothSettle(tester);
    expect(find.text('Tasks'), findsOneWidget);

    // Create Task (FAB by tooltip)
    final fabFinder = find.byTooltip('Create Task');
    await tester.ensureVisible(fabFinder);
    await tester.tap(fabFinder, warnIfMissed: false);
    await smoothSettle(tester);
    expect(find.text('New Task'), findsOneWidget);

    // Select Task Type
    await tester.tap(find.widgetWithText(DropdownButtonFormField<String>, 'Task Type'));
    await smoothSettle(tester);
    await tester.tap(find.text('Plant').last);
    await smoothSettle(tester);

    // Select Field
    await tester.tap(find.widgetWithText(DropdownButtonFormField<int>, 'Field'));
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.tap(find.text('Field 1').last);
    await tester.pumpAndSettle(const Duration(seconds: 1));

    // Fill Task Name
    await tester.enterText(find.widgetWithText(TextFormField, 'Task Name'), 'Integration Web Task');
    await tester.pump(const Duration(milliseconds: 700));

    // Save Task
    final saveFinder = find.text('Save Task');
    await tester.ensureVisible(saveFinder);
    await tester.tap(saveFinder, warnIfMissed: false);
    await smoothSettle(tester);
    expect(find.text('Tasks'), findsOneWidget);

    // Filter and open the created task
    final filterBox = find.byType(TextField).first;
    await tester.tap(filterBox);
    await tester.enterText(filterBox, 'Integration Web Task');
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.tapAt(const Offset(10, 100));
    await smoothSettle(tester);

    final taskTile = find.ancestor(of: find.text('Integration Web Task'), matching: find.byType(ListTile)).first;
    await tester.ensureVisible(taskTile);
    await tester.tap(taskTile, warnIfMissed: false);
    await smoothSettle(tester);
    expect(find.text('Task Detail'), findsOneWidget);

    // Open actions and run Start/Pause/Start/Complete
    await tester.tap(find.text('Open Task Actions'));
    await smoothSettle(tester);
    expect(find.text('Task Actions'), findsOneWidget);

    // Start
    await tester.tap(find.text('Start'), warnIfMissed: false);
    await smoothSettle(tester);
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    // Pause
    await tester.tap(find.text('Pause'), warnIfMissed: false);
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    // Start again
    await tester.tap(find.text('Start'), warnIfMissed: false);
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    // Complete (dismiss barrier)
    await tester.tap(find.text('Complete'));
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.tapAt(const Offset(10, 10));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    // Back to Tasks
    final backIcon = find.byIcon(Icons.arrow_back);
    await tester.tap(backIcon);
    await smoothSettle(tester);
    await tester.tap(backIcon);
    await smoothSettle(tester);
    expect(find.text('Tasks'), findsOneWidget);

    // Create another task and Cancel it
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
    final nameField2 = find.widgetWithText(TextFormField, 'Task Name');
    if (nameField2.evaluate().isNotEmpty) {
      await tester.enterText(nameField2, 'Integration Web Task Cancel');
      await tester.pumpAndSettle(const Duration(seconds: 1));
    }
    await tester.ensureVisible(saveFinder);
    await tester.tap(saveFinder, warnIfMissed: false);
    await tester.pumpAndSettle(const Duration(seconds: 1));
    expect(find.text('Tasks'), findsOneWidget);

    // Open and cancel
    await tester.tap(filterBox);
    await tester.enterText(filterBox, 'Integration Web Task Cancel');
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.tapAt(const Offset(10, 100));
    await smoothSettle(tester);
    final cancelTile = find.ancestor(of: find.text('Integration Web Task Cancel'), matching: find.byType(ListTile)).first;
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

    // Back to Tasks
    await tester.tap(backIcon);
    await smoothSettle(tester);
    await tester.tap(backIcon);
    await smoothSettle(tester);
    expect(find.text('Tasks'), findsOneWidget);

    // Navigate to Farm Sites and create a Field
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

    await tester.enterText(find.widgetWithText(TextFormField, 'Name'), 'FT-Integration Web');
    await tester.enterText(find.widgetWithText(TextFormField, 'Row width (m)'), '2.5');
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
