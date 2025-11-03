import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../drift/app_database.dart';
import '../../app/providers/global_providers.dart';

final usersRepoProvider = Provider<UsersRepo>((ref) {
  final db = ref.watch(databaseProvider);
  return UsersRepo(UsersDao(db));
});

class UsersRepo {
  final UsersDao _dao;
  UsersRepo(this._dao);

  Future<User?> findByUsername(String username) => _dao.findByUsername(username);
  Future<User?> getById(int id) => (_dao.select(_dao.users)..where((t) => t.userId.equals(id))).getSingleOrNull();
  Stream<User?> watchById(int id) => (_dao.select(_dao.users)..where((t) => t.userId.equals(id))).watchSingleOrNull();
}
