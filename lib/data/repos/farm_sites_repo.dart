import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:drift/drift.dart' show Value;
import '../drift/app_database.dart';
import '../../app/providers/global_providers.dart';

final farmSitesRepoProvider = Provider<FarmSitesRepo>((ref) {
  final db = ref.watch(databaseProvider);
  return FarmSitesRepo(FarmSitesDao(db));
});

class FarmSitesRepo {
  final FarmSitesDao _dao;
  FarmSitesRepo(this._dao);

  Stream<List<FarmSite>> watchAll() => _dao.watchAllSites();
  Future<int> addSite(String name, {required int defaultCropId, int? createdUserId, required int modifiedUserId}) {
    final now = DateTime.now();
    return _dao.insertSite(FarmSitesCompanion.insert(
      farmSiteName: name,
      defaultPrimaryCropId: Value(defaultCropId),
      createdDate: Value(now),
      createdUserId: Value(createdUserId),
      modifiedDate: Value(now),
      modifiedUserId: Value(modifiedUserId),
      isDeleted: const Value(false),
    ));
  }
}
