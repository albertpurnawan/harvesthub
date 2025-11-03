part of 'package:harvesthub_mobile/data/drift/app_database.dart';

class Users extends Table {
  IntColumn get userId => integer().customConstraint('PRIMARY KEY')();
  BoolColumn get isCustomerUser => boolean().customConstraint('NOT NULL CHECK ("is_customer_user" IN (0, 1))')();
  TextColumn get username => text().nullable()();
  TextColumn get userPassword => text().nullable()();
  TextColumn get userGivenName => text().nullable()();
  TextColumn get userEmailAddress => text().customConstraint('NOT NULL')();
  DateTimeColumn get createdDate => dateTime().customConstraint('NOT NULL')();
  IntColumn get createdUserId => integer().nullable()();
  DateTimeColumn get modifiedDate => dateTime().customConstraint('NOT NULL')();
  IntColumn get modifiedUserId => integer().customConstraint('NOT NULL')();
  TextColumn get userStatus => text().customConstraint("NOT NULL CHECK (user_status IN ('Active','Inactive'))")();
  BoolColumn get isDeleted => boolean().customConstraint('NOT NULL DEFAULT 0 CHECK ("is_deleted" IN (0, 1))')();
  IntColumn get farmSiteId => integer().nullable().references(FarmSites, #farmSiteId)();
}

@DriftAccessor(tables: [Users])
class UsersDao extends DatabaseAccessor<AppDatabase> with _$UsersDaoMixin {
  UsersDao(AppDatabase db) : super(db);

  Future<int> insertUser(UsersCompanion user) => into(users).insert(user);
  Future<User?> findByUsername(String username) => (select(users)..where((t) => t.username.equals(username))).getSingleOrNull();
  Stream<List<User>> watchAllUsers() => select(users).watch();
}
