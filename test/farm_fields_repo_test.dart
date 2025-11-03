import 'package:drift/native.dart';
import 'package:drift/drift.dart' show Value;
import 'package:flutter_test/flutter_test.dart';
import 'package:harvesthub_mobile/data/drift/app_database.dart';
import 'package:harvesthub_mobile/data/repos/farm_fields_repo.dart';
import 'package:harvesthub_mobile/data/seed_dev_data.dart';

void main() {
  late AppDatabase db;
  late FarmFieldsRepo repo;
  late int siteId;

  setUp(() async {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    await seedDevData(db);
    repo = FarmFieldsRepo(FarmFieldsDao(db));
    // Use existing site id from seeded data
    final sites = await db.select(db.farmSites).get();
    siteId = sites.first.farmSiteId;
  });

  tearDown(() async {
    await db.close();
  });

  test('FarmFieldCode increments with zero-pad', () async {
    // Ensure no pre-seeded fields with code to avoid interference
    final existing = await db.select(db.farmFields).get();
    expect(existing.where((f) => f.farmFieldName == 'Alpha Field').isEmpty, true);

    await repo.addField(siteId: siteId, name: 'Alpha Field', rowWidth: 2.0, rowDirection: '', colorHex: '00FF00', modifiedUserId: 1);
    await repo.addField(siteId: siteId, name: 'Alpha Field', rowWidth: 2.0, rowDirection: '', colorHex: '00FF00', modifiedUserId: 1);
    final fields = await db.select(db.farmFields).get();
    final alpha = fields.where((f) => f.farmFieldName == 'Alpha Field').toList();
    expect(alpha[0].farmFieldCode, 'Alpha Field.001');
    expect(alpha[1].farmFieldCode, 'Alpha Field.002');
    await db.close();
  });
}
