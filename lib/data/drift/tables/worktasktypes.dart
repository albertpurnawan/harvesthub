part of '../app_database.dart';

class WorkTaskTypes extends Table {
  TextColumn get workTaskTypeCode => text().customConstraint('PRIMARY KEY')();
  DateTimeColumn get createdDate => dateTime().customConstraint('NOT NULL')();
  IntColumn get createdUserId => integer().nullable()();
  DateTimeColumn get modifiedDate => dateTime().customConstraint('NOT NULL')();
  IntColumn get modifiedUserId => integer().customConstraint('NOT NULL')();
  BoolColumn get isDeleted => boolean().customConstraint('NOT NULL DEFAULT 0 CHECK ("is_deleted" IN (0, 1))')();
}

@DriftAccessor(tables: [WorkTaskTypes])
class WorkTaskTypesDao extends DatabaseAccessor<AppDatabase> with _$WorkTaskTypesDaoMixin {
  WorkTaskTypesDao(AppDatabase db) : super(db);

  Future<int> insertType(WorkTaskTypesCompanion type) => into(workTaskTypes).insert(type);
  Stream<List<WorkTaskType>> watchAllTypes() => select(workTaskTypes).watch();
}
