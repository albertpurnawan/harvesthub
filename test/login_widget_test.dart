import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:harvesthub_mobile/main.dart';
import 'package:harvesthub_mobile/app/providers/global_providers.dart';
import 'package:harvesthub_mobile/data/drift/app_database.dart';
// Do not import generated part; importing app_database.dart is sufficient.
import 'package:shared_preferences/shared_preferences.dart';
import 'package:drift/native.dart';

void main() {
  testWidgets('Login with admin/admin navigates to Tasks', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    final db = AppDatabase.forTesting(NativeDatabase.memory());
    // seed admin user
    final usersDao = UsersDao(db);
    await usersDao.insertUser(UsersCompanion.insert(username: 'admin', userPassword: 'admin'));

    await tester.pumpWidget(ProviderScope(overrides: [databaseProvider.overrideWithValue(db)], child: const HarvestHubApp()));

    // Should be on login screen: find Username and Password labels
    expect(find.text('Username'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);

    await tester.enterText(find.widgetWithText(TextFormField, 'Username'), 'admin');
    await tester.enterText(find.widgetWithText(TextFormField, 'Password'), 'admin');
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    // Tasks screen title
    expect(find.text('Tasks'), findsOneWidget);
    // FAB exists
    expect(find.byTooltip('Create Task'), findsOneWidget);

    // Clean up DB to avoid pending timers from streams
    await db.close();
  });
}
