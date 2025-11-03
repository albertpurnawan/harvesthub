part of 'package:harvesthub_mobile/data/drift/app_database.dart';


class WorkTasks extends Table {
  IntColumn get workTaskId => integer().customConstraint('PRIMARY KEY')();
  IntColumn get farmFieldId => integer().customConstraint('NOT NULL REFERENCES farm_fields (farm_field_id)')();
  TextColumn get workTaskTypeCode => text().customConstraint('NOT NULL REFERENCES work_task_types (work_task_type_code)')();
  TextColumn get workTaskStatusCode => text().customConstraint("NOT NULL CHECK (work_task_status_code IN ('Complete','Open','Underway','Overdue'))")();
  DateTimeColumn get startedDate => dateTime().customConstraint('NOT NULL')();
  DateTimeColumn get cancelledDate => dateTime().nullable()();
  DateTimeColumn get dueDate => dateTime().customConstraint('NOT NULL')();
  DateTimeColumn get createdDate => dateTime().customConstraint('NOT NULL')();
  IntColumn get createdUserId => integer().nullable()();
  DateTimeColumn get modifiedDate => dateTime().customConstraint('NOT NULL')();
  IntColumn get modifiedUserId => integer().customConstraint('NOT NULL')();
  BoolColumn get isCompleted => boolean().customConstraint('NOT NULL DEFAULT 0 CHECK ("is_completed" IN (0, 1))')();
  BoolColumn get isDeleted => boolean().customConstraint('NOT NULL DEFAULT 0 CHECK ("is_deleted" IN (0, 1))')();
  BoolColumn get isStarted => boolean().customConstraint('NOT NULL DEFAULT 0 CHECK ("is_started" IN (0, 1))')();
  BoolColumn get isCancelled => boolean().customConstraint('NOT NULL DEFAULT 0 CHECK ("is_cancelled" IN (0, 1))')();
}

@DriftAccessor(tables: [WorkTasks])
class WorkTasksDao extends DatabaseAccessor<AppDatabase> with _$WorkTasksDaoMixin {
  WorkTasksDao(AppDatabase db) : super(db);

  Future<int> insertTask(WorkTasksCompanion task) => into(workTasks).insert(task);
  Future<bool> updateTask(WorkTask task) => update(workTasks).replace(task);
  Future<int> deleteTask(int id) => (delete(workTasks)..where((t) => t.workTaskId.equals(id))).go();
  Stream<List<WorkTask>> watchAllTasks() => select(workTasks).watch();
  Stream<List<WorkTask>> watchTasksByStatus(String status) => (select(workTasks)..where((t) => t.workTaskStatusCode.equals(status))).watch();
  Stream<List<WorkTask>> watchTasksByField(int fieldId) => (select(workTasks)..where((t) => t.farmFieldId.equals(fieldId))).watch();
}
