import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../drift/app_database.dart';
import '../../app/providers/global_providers.dart';

final cropsRepoProvider = Provider<CropsRepo>((ref) {
  final db = ref.watch(databaseProvider);
  return CropsRepo(CropsDao(db));
});

class CropsRepo {
  final CropsDao _dao;
  CropsRepo(this._dao);
  Stream<List<Crop>> watchAll() => _dao.watchAllCrops();
}

