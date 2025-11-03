import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../app/providers/global_providers.dart';
import '../../../data/drift/app_database.dart';

class AuthState {
  final bool loading;
  final String? error;
  const AuthState({this.loading = false, this.error});

  AuthState copyWith({bool? loading, String? error}) =>
      AuthState(loading: loading ?? this.loading, error: error ?? this.error);
}

final authControllerProvider = StateNotifierProvider<AuthController, AuthState>((ref) {
  final db = ref.watch(databaseProvider);
  return AuthController(ref, UsersDao(db));
});

class AuthController extends StateNotifier<AuthState> {
  final Ref _ref;
  final UsersDao _usersDao;
  AuthController(this._ref, this._usersDao) : super(const AuthState());

  Future<bool> login(String username, String password) async {
    state = state.copyWith(loading: true, error: null);
    try {
      final user = await _usersDao.findByUsername(username);
      if (user != null && user.userPassword == password) {
        _ref.read(sessionUserIdProvider.notifier).state = user.userId;
        final prefs = await SharedPreferences.getInstance();
        await prefs.setInt('session_user_id', user.userId);
        // Set session expiry to 1 day from now
        final expiryMs = DateTime.now().add(const Duration(days: 1)).millisecondsSinceEpoch;
        await prefs.setInt('session_expiry', expiryMs);
        return true;
      } else {
        state = state.copyWith(error: 'Invalid credentials');
        return false;
      }
    } finally {
      state = state.copyWith(loading: false);
    }
  }

  Future<bool> register(String username, String password) async {
    state = state.copyWith(loading: true, error: null);
    try {
      final existing = await _usersDao.findByUsername(username);
      if (existing != null) {
        state = state.copyWith(error: 'Username already exists');
        return false;
      }
      final uid = await _usersDao.insertUser(UsersCompanion.insert(
        username: username,
        userPassword: password,
      ));
      _ref.read(sessionUserIdProvider.notifier).state = uid;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('session_user_id', uid);
      // Set session expiry to 1 day from now
      final expiryMs = DateTime.now().add(const Duration(days: 1)).millisecondsSinceEpoch;
      await prefs.setInt('session_expiry', expiryMs);
      return true;
    } finally {
      state = state.copyWith(loading: false);
    }
  }

  Future<void> logout() async {
    _ref.read(sessionUserIdProvider.notifier).state = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('session_user_id');
    await prefs.remove('session_expiry');
  }
}
