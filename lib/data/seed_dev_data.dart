import 'package:drift/drift.dart';
import 'drift/app_database.dart';
import 'constants/task_status.dart';

Future<void> seedDevData(AppDatabase db) async {
  // crops
  final cropsDao = CropsDao(db);
  final cropCodes = ['Sugar Cane', 'Oil Palms', 'SoyBeans'];
  for (final code in cropCodes) {
    await cropsDao.insertCrop(CropsCompanion.insert(cropCode: code));
  }

  // users
  final usersDao = UsersDao(db);
  final now = DateTime.now();
  final userId = await usersDao.insertUser(UsersCompanion.insert(
    userId: const Value(1),
    isCustomerUser: const Value(false),
    username: 'admin',
    userPassword: 'admin',
    userGivenName: const Value('Admin'),
    userEmailAddress: const Value('admin@example.com'),
    createdDate: Value(now),
    modifiedDate: Value(now),
    modifiedUserId: const Value(1),
    userStatus: const Value('Active'),
    isDeleted: const Value(false),
  ));

  // sites
  final sitesDao = FarmSitesDao(db);
  for (var i = 1; i <= 5; i++) {
    await sitesDao.insertSite(FarmSitesCompanion.insert(
      farmSiteId: Value(i),
      farmSiteName: 'Site $i',
      createdDate: Value(now),
      modifiedDate: Value(now),
      modifiedUserId: const Value(1),
      defaultPrimaryCropId: const Value(1),
      createdUserId: Value(userId),
      isDeleted: const Value(false),
    ));
  }

  // fields
  final fieldsDao = FarmFieldsDao(db);
  for (var i = 1; i <= 10; i++) {
    final siteId = (i % 5) + 1;
    await fieldsDao.insertField(FarmFieldsCompanion.insert(
      farmFieldId: Value(i),
      farmSiteId: siteId,
      farmFieldName: 'Field $i',
      farmFieldCode: Value('F$i'),
      rowWidth: const Value(2.0),
      farmFieldRowDirection: const Value('North-South'),
      farmFieldColorHexCode: const Value('00FF00'),
      createdDate: Value(now),
      modifiedDate: Value(now),
      modifiedUserId: const Value(1),
      isDeleted: const Value(false),
      createdUserId: Value(userId),
      description: Value('Description for Field $i'),
      primaryCropId: const Value(1),
    ));
  }

  // task types (set to specific names)
  final typesDao = WorkTaskTypesDao(db);
  final typeCodes = ['Cultivate', 'Fertilize', 'Spray', 'Irrigate', 'Plant', 'Harvest'];
  for (final code in typeCodes) {
    await typesDao.insertType(WorkTaskTypesCompanion.insert(
      workTaskTypeCode: code,
      createdDate: Value(now),
      modifiedDate: Value(now),
      modifiedUserId: const Value(1),
      isDeleted: const Value(false),
      createdUserId: Value(userId),
    ));
  }

  // tasks
  final tasksDao = WorkTasksDao(db);
  for (var i = 1; i <= 20; i++) {
    final status = i % 4 == 0
        ? kStatusComplete
        : i % 3 == 0
            ? kStatusUnderway
            : kStatusOpen;
    await tasksDao.insertTask(WorkTasksCompanion.insert(
      workTaskId: Value(i),
      farmFieldId: (i % 10) + 1,
      workTaskTypeCode: typeCodes[i % typeCodes.length],
      workTaskStatusCode: Value(status),
      startedDate: Value(now),
      dueDate: Value(now.add(Duration(days: i - 10))),
      createdDate: Value(now),
      modifiedDate: Value(now),
      modifiedUserId: const Value(1),
      isCompleted: Value(status == kStatusComplete),
      isStarted: Value(status == kStatusUnderway),
      isDeleted: const Value(false),
      isCancelled: const Value(false),
      createdUserId: Value(userId),
    ));
  }
}
