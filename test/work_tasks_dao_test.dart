import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:harvesthub_mobile/data/drift/app_database.dart';
import 'package:harvesthub_mobile/data/seed_dev_data.dart';

void main() {
  late AppDatabase db;
  late WorkTasksDao dao;

  setUp(() {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    dao = WorkTasksDao(db);
  });

  tearDown(() async {
    await db.close();
  });

  test('insert and fetch task', () async {
    // Use project seeder to satisfy all FKs and required data
    await seedDevData(db);
    final fields = await db.select(db.farmFields).get();
    final fieldId = fields.first.farmFieldId;
    final now = DateTime.now();
    final id = await dao.insertTask(WorkTasksCompanion.insert(
      farmFieldId: fieldId,
      workTaskTypeCode: 'Plant',
      workTaskStatusCode: const Value('Open'),
      modifiedUserId: const Value(1),
      startedDate: Value(now),
      dueDate: Value(now.add(const Duration(days: 1))),
      createdDate: Value(now),
      modifiedDate: Value(now),
    ));
    expect(id, isNonZero);
    final all = await dao.select(db.workTasks).get();
    expect(all.isNotEmpty, true);
  });
}
