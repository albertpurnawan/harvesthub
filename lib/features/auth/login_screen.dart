import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:harvesthub_mobile/app/router/app_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../app/providers/global_providers.dart';
import '../../app/widgets/harvesthub_app_bar.dart';
import 'controllers/auth_controller.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usernameController = useTextEditingController();
    final passwordController = useTextEditingController();
    final auth = ref.watch(authControllerProvider);
    final authCtrl = ref.read(authControllerProvider.notifier);
    final prefsAsync = ref.watch(sharedPrefsProvider);

    useEffect(() {
      // auto redirect if session exists and not expired (1 day)
      prefsAsync.whenData((prefs) async {
        final uid = prefs.getInt('session_user_id');
        final expiry = prefs.getInt('session_expiry');
        final nowMs = DateTime.now().millisecondsSinceEpoch;
        final valid = uid != null && expiry != null && expiry > nowMs;
        if (valid) {
          ref.read(sessionUserIdProvider.notifier).state = uid;
          if (context.mounted) ref.read(appRouterProvider).go('/tasks');
        } else {
          // clear any stale session
          await prefs.remove('session_user_id');
          await prefs.remove('session_expiry');
        }
      });
      return null;
    }, const []);

    Future<void> login() async {
      final ok = await authCtrl.login(usernameController.text.trim(), passwordController.text);
      if (!context.mounted) return;
      if (ok) {
        ref.read(appRouterProvider).go('/tasks');
      } else if (auth.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(auth.error!)));
      }
    }

    final formKey = useMemoized(GlobalKey<FormState>.new);
    final isRegister = useState(false);

    Future<void> register() async {
      final username = usernameController.text.trim();
      final password = passwordController.text;
      if (username.isEmpty || password.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please fill username and password')));
        return;
      }
      final ok = await authCtrl.register(username, password);
      if (!context.mounted) return;
      if (ok) {
        ref.read(appRouterProvider).go('/tasks');
      } else if (auth.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(auth.error!)));
      }
    }

    return Scaffold(
      appBar: const HarvestHubAppBar(),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('lib/assets/logo.png', height: 36),
                          const SizedBox(width: 10),
                          const Text('HarvestHub', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                        ],
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: usernameController,
                        decoration: const InputDecoration(
                          labelText: 'Username',
                          prefixIcon: Icon(Icons.person_outline),
                          border: OutlineInputBorder(),
                        ),
                        validator: (v) => (v == null || v.trim().isEmpty) ? 'Username is required' : null,
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock_outline),
                          border: OutlineInputBorder(),
                        ),
                        validator: (v) => (v == null || v.isEmpty) ? 'Password is required' : null,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () async {
                          final valid = formKey.currentState?.validate() ?? false;
                          if (!valid) return;
                          if (isRegister.value) {
                            await register();
                          } else {
                            await login();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          foregroundColor: Theme.of(context).colorScheme.onPrimary,
                        ),
                        child: Text(isRegister.value ? 'Register' : 'Login'),
                      ),
                      const SizedBox(height: 12),
                      TextButton(
                      onPressed: () => isRegister.value = !isRegister.value,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: isRegister.value ? 'Already have an account? ' : 'New here? ',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface,
                                fontSize: 14,
                              ),
                            ),
                            TextSpan(
                              text: isRegister.value ? 'Login' : 'Create an account',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ),
          ),
        ),
      ),
    );
  }
}
