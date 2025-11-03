part of 'package:harvesthub_mobile/data/drift/app_database.dart';

class FarmFields extends Table {
  IntColumn get farmFieldId => integer().customConstraint('PRIMARY KEY')();
  IntColumn get farmSiteId => integer().customConstraint('NOT NULL REFERENCES farm_sites (farm_site_id)')();
  TextColumn get farmFieldName => text().customConstraint('NOT NULL')();
  TextColumn get farmFieldCode => text().customConstraint('NOT NULL')();
  TextColumn get description => text().nullable()();
  IntColumn get primaryCropId => integer().nullable().references(Crops, #cropId)();
  RealColumn get rowWidth => real().customConstraint('NOT NULL')();
  TextColumn get farmFieldRowDirection => text().customConstraint('NOT NULL')();
  TextColumn get farmFieldColorHexCode => text().customConstraint('NOT NULL')();
  DateTimeColumn get createdDate => dateTime().customConstraint('NOT NULL')();
  IntColumn get createdUserId => integer().nullable()();
  DateTimeColumn get modifiedDate => dateTime().customConstraint('NOT NULL')();
  IntColumn get modifiedUserId => integer().customConstraint('NOT NULL')();
  BoolColumn get isDeleted => boolean().customConstraint('NOT NULL DEFAULT 0 CHECK ("is_deleted" IN (0, 1))')();
}

@DriftAccessor(tables: [FarmFields])
class FarmFieldsDao extends DatabaseAccessor<AppDatabase> with _$FarmFieldsDaoMixin {
  FarmFieldsDao(AppDatabase db) : super(db);

  Future<int> insertField(FarmFieldsCompanion field) => into(farmFields).insert(field);
  Future<bool> updateField(FarmField field) => update(farmFields).replace(field);
  Future<int> deleteField(int id) => (delete(farmFields)..where((t) => t.farmFieldId.equals(id))).go();
  Stream<List<FarmField>> watchFieldsBySite(int siteId) => (select(farmFields)..where((t) => t.farmSiteId.equals(siteId))).watch();
  Future<List<FarmField>> getFieldsBySite(int siteId) => (select(farmFields)..where((t) => t.farmSiteId.equals(siteId))).get();
  Future<int> countFieldsWithName(String name) async {
    final query = await (selectOnly(farmFields)..addColumns([farmFields.farmFieldId.count()])..where(farmFields.farmFieldName.equals(name))).getSingle();
    return query.read<int>(farmFields.farmFieldId.count()) ?? 0;
  }
}
