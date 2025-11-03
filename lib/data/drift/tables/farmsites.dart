part of 'package:harvesthub_mobile/data/drift/app_database.dart';

class FarmSites extends Table {
  IntColumn get farmSiteId => integer().customConstraint('PRIMARY KEY')();
  TextColumn get farmSiteName => text().customConstraint('NOT NULL')();
  DateTimeColumn get createdDate => dateTime().customConstraint('NOT NULL')();
  IntColumn get createdUserId => integer().nullable()();
  DateTimeColumn get modifiedDate => dateTime().customConstraint('NOT NULL')();
  IntColumn get modifiedUserId => integer().customConstraint('NOT NULL')();
  IntColumn get defaultPrimaryCropId => integer().customConstraint('NOT NULL REFERENCES crops (crop_id)')();
  BoolColumn get isDeleted => boolean().customConstraint('NOT NULL DEFAULT 0 CHECK ("is_deleted" IN (0, 1))')();
}

@DriftAccessor(tables: [FarmSites])
class FarmSitesDao extends DatabaseAccessor<AppDatabase> with _$FarmSitesDaoMixin {
  FarmSitesDao(AppDatabase db) : super(db);

  Future<int> insertSite(FarmSitesCompanion site) => into(farmSites).insert(site);
  Future<bool> updateSite(FarmSite site) => update(farmSites).replace(site);
  Future<int> deleteSite(int id) => (delete(farmSites)..where((t) => t.farmSiteId.equals(id))).go();
  Stream<List<FarmSite>> watchAllSites() => (select(farmSites)..orderBy([(t) => OrderingTerm.asc(t.farmSiteName)])).watch();
  Future<List<FarmSite>> getAllSites() => select(farmSites).get();
}
