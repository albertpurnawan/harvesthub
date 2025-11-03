import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../drift/app_database.dart';
import '../../app/providers/global_providers.dart';

final workTaskTypesRepoProvider = Provider<WorkTaskTypesRepo>((ref) {
  final db = ref.watch(databaseProvider);
  return WorkTaskTypesRepo(WorkTaskTypesDao(db));
});

class WorkTaskTypesRepo {
  final WorkTaskTypesDao _dao;
  WorkTaskTypesRepo(this._dao);
  Stream<List<WorkTaskType>> watchAll() => _dao.watchAllTypes();
}
