import 'package:flutter_test/flutter_test.dart';
import 'package:harvesthub_mobile/app/providers/global_providers.dart';
import 'package:harvesthub_mobile/features/auth/controllers/auth_controller.dart';
import 'package:harvesthub_mobile/data/drift/app_database.dart';
// Do not import generated part; importing app_database.dart is sufficient.
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:drift/native.dart';

void main() {
  late AppDatabase db;
  late ProviderContainer container;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    db = AppDatabase.forTesting(NativeDatabase.memory());
    container = ProviderContainer(overrides: [
      databaseProvider.overrideWithValue(db),
    ]);
    // seed one user
    final usersDao = UsersDao(db);
    await usersDao.insertUser(UsersCompanion.insert(
      username: 'john',
      userPassword: 'pwd123',
    ));
  });

  tearDown(() async {
    await db.close();
    container.dispose();
  });

  test('login succeeds and sets session + prefs', () async {
    final controller = container.read(authControllerProvider.notifier);
    final ok = await controller.login('john', 'pwd123');
    expect(ok, isTrue);
    // session user id should be set
    final uid = container.read(sessionUserIdProvider);
    expect(uid, isNotNull);
    // prefs should contain session keys
    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getInt('session_user_id'), equals(uid));
    expect(prefs.getInt('session_expiry'), isNotNull);
  });

  test('login fails with wrong password', () async {
    final controller = container.read(authControllerProvider.notifier);
    final ok = await controller.login('john', 'wrong');
    expect(ok, isFalse);
    final state = container.read(authControllerProvider);
    expect(state.error, equals('Invalid credentials'));
  });

  test('register creates new user and sets session', () async {
    final controller = container.read(authControllerProvider.notifier);
    final ok = await controller.register('alice', 'secret');
    expect(ok, isTrue);
    final uid = container.read(sessionUserIdProvider);
    expect(uid, isNotNull);
    final users = await db.select(db.users).get();
    expect(users.any((u) => u.username == 'alice'), isTrue);
  });
}
