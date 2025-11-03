import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:drift/drift.dart' show Value;
import '../drift/app_database.dart';
import '../../app/providers/global_providers.dart';

final farmFieldsRepoProvider = Provider<FarmFieldsRepo>((ref) {
  final db = ref.watch(databaseProvider);
  return FarmFieldsRepo(FarmFieldsDao(db));
});

class FarmFieldsRepo {
  final FarmFieldsDao _dao;
  FarmFieldsRepo(this._dao);

  Stream<List<FarmField>> watchBySite(int siteId) => _dao.watchFieldsBySite(siteId);

  Future<int> addField({
    required int siteId,
    required String name,
    String? code,
    String? description,
    int? primaryCropId,
    required double rowWidth,
    required String rowDirection,
    required String colorHex,
    int? createdUserId,
    required int modifiedUserId,
  }) async {
    final count = await _dao.countFieldsWithName(name);
    final resolvedCode = (code == null || code.trim().isEmpty)
        ? '$name.${(count + 1).toString().padLeft(3, '0')}'
        : code.trim();
    final now = DateTime.now();
    return _dao.insertField(FarmFieldsCompanion.insert(
      farmSiteId: siteId,
      farmFieldName: name,
      farmFieldCode: Value(resolvedCode),
      description: Value(description),
      primaryCropId: Value(primaryCropId),
      rowWidth: Value(rowWidth),
      farmFieldRowDirection: Value(rowDirection),
      farmFieldColorHexCode: Value(colorHex),
      createdDate: Value(now),
      createdUserId: Value(createdUserId),
      modifiedDate: Value(now),
      modifiedUserId: Value(modifiedUserId),
      isDeleted: const Value(false),
    ));
  }
}
