part of 'package:harvesthub_mobile/data/drift/app_database.dart';

class Crops extends Table {
  IntColumn get cropId => integer().customConstraint('PRIMARY KEY')();
  TextColumn get cropCode => text().customConstraint('NOT NULL')();
  DateTimeColumn get createdDate => dateTime().customConstraint('NOT NULL')();
  IntColumn get createdUserId => integer().nullable()();
  DateTimeColumn get modifiedDate => dateTime().customConstraint('NOT NULL')();
  IntColumn get modifiedUserId => integer().customConstraint('NOT NULL')();
  BoolColumn get isDeleted => boolean().customConstraint('NOT NULL DEFAULT 0 CHECK ("is_deleted" IN (0, 1))')();
}

@DriftAccessor(tables: [Crops])
class CropsDao extends DatabaseAccessor<AppDatabase> with _$CropsDaoMixin {
  CropsDao(AppDatabase db) : super(db);

  Future<int> insertCrop(CropsCompanion crop) => into(crops).insert(crop);
  Stream<List<Crop>> watchAllCrops() => select(crops).watch();
}
