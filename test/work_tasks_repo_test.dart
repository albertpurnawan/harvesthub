import 'package:drift/native.dart';
import 'package:drift/drift.dart' show Value;
import 'package:flutter_test/flutter_test.dart';
import 'package:harvesthub_mobile/data/drift/app_database.dart';
import 'package:harvesthub_mobile/data/seed_dev_data.dart';
import 'package:harvesthub_mobile/data/repos/work_tasks_repo.dart';

void main() {
  late AppDatabase db;
  late WorkTasksRepo repo;

  setUp(() {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    repo = WorkTasksRepo(WorkTasksDao(db));
  });

  tearDown(() async {
    await db.close();
  });

  test('status transitions', () async {
    // satisfy FKs
    await seedDevData(db);
    final sitesDao = FarmSitesDao(db);
    final siteId = (await sitesDao.getAllSites()).first.farmSiteId;
    final fieldsDao = FarmFieldsDao(db);
    final fieldId = await fieldsDao.insertField(FarmFieldsCompanion.insert(
      farmSiteId: siteId,
      farmFieldName: 'F1',
      farmFieldCode: const Value('F1'),
      description: const Value('desc'),
      primaryCropId: const Value(null),
    ));
    // 'Plant' is seeded by seedDevData; no need to insert

    final id = await repo.addTask(fieldId: fieldId, typeCode: 'Plant', dueDate: DateTime.now(), modifiedUserId: 1);
    final task = (await db.select(db.workTasks).get()).firstWhere((t) => t.workTaskId == id);
    expect(task.isStarted, false);
    await repo.startTask(task);
    final started = (await db.select(db.workTasks).get()).firstWhere((t) => t.workTaskId == id);
    expect(started.isStarted, true);
    await repo.completeTask(started);
    final completed = (await db.select(db.workTasks).get()).firstWhere((t) => t.workTaskId == id);
    expect(completed.isCompleted, true);
    await db.close();
  });
}
