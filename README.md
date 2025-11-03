# HarvestHub Mobile (Flutter)

Flutter mobile app for agriculture task management and field monitoring.

## Setup

1. Ensure Flutter (3.24+) and Dart (3.4+) are installed.
2. Create Flutter project scaffolding (runnable platforms):
   - `flutter create harvesthub_mobile` (if not already created by you)
3. From `harvesthub_mobile`, run `flutter pub get`.
4. Run code generation: `dart run build_runner build -d`.
5. Run the app: `flutter run`.
6. Login with username/password: admin/admin

## Drift notes

- Local SQLite via Drift. DB file at app documents directory `harvesthub.sqlite`.
- To reset DB in debug, delete the app or remove the file manually.

## Tests

- Unit/widget: `flutter test`
- Integration (Android):
  - Start an emulator or connect a device: `flutter devices`
  - Run: `scripts/run_integration_android.sh` (or pass a device id)
  - Driver/target overrides: `DRIVER=test_driver/integration_test.dart TARGET=integration_test/app_flow_test.dart scripts/run_integration_android.sh`
- Integration (iOS):
  - Fix CocoaPods first (see iOS section below)
  - Start a Simulator: `open -a Simulator` (e.g., iPhone 15 Pro)
  - Run: `scripts/run_integration_ios.sh` (or pass a simulator id/name)
  - Driver/target overrides: `DRIVER=test_driver/integration_test.dart TARGET=integration_test/app_flow_test.dart scripts/run_integration_ios.sh`
 - Web E2E (widget-based on Chrome):
   - Ensure Chrome is installed and Flutter web is enabled: `flutter config --enable-web`
   - Run: `bash scripts/run_integration_web.sh`
     - First time: `chmod +x scripts/run_integration_web.sh`
   - Catatan: paket `integration_test` belum mendukung device web. Skrip ini menjalankan skenario E2E dalam bentuk widget test di Chrome (`test/web_app_flow_test.dart`).
 - Seeded test login credentials: `admin / admin`
 - TestSprite scenarios (optional E2E assistant): see `testsprite/README.md`

Notes:
- If the simulator fails to boot, open it manually via Spotlight (“Simulator”) and retry.
- If you see SQLite linking errors on iOS, run `flutter clean`, then `flutter pub get`, and rebuild.
 - On web, Drift uses IndexedDB (`WebDatabase('harvesthub')`). Tests run in Chrome headless via Flutter test runner.

## Troubleshooting

- iOS simulator may need `sqlite3_flutter_libs` properly linked. Clean and rebuild if errors occur.

### iOS CocoaPods (install/broken state)
If you see "CocoaPods is installed but broken" or "CocoaPods not installed or not in valid state":

1) Prefer project-local CocoaPods via Bundler
   - `gem install bundler`
   - `cd ios && bundle install`
   - `bundle exec pod repo update`
   - `bundle exec pod install`
2) Reset Flutter artifacts
   - `cd .. && flutter clean && flutter pub get`
3) Verify Xcode toolchain
   - `xcode-select -p` (points to Xcode), open Xcode once and accept prompts
4) Run the iOS integration test
   - `open -a Simulator`
   - `scripts/run_integration_ios.sh`

Global alternative:
- System Ruby: `sudo gem uninstall cocoapods && sudo gem install cocoapods`
- Homebrew: `brew reinstall ruby && brew reinstall cocoapods`
- rbenv/rvm: set your Ruby version, `gem install cocoapods`, then `rbenv rehash`

Tip: After changing Ruby/CocoaPods, restart your terminal (`exec zsh -l`) to refresh PATH.

## Codebase Cleanup

- Removed inline explanatory comments that looked auto-generated or AI-authored to keep the codebase concise and professional.
- Kept framework-generated headers (e.g., Drift/Freezed `GENERATED CODE` notices) intact.
- If you need commentary for maintainers, prefer doc comments (`///`) near functions and classes.
