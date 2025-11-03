Fixing CocoaPods on macOS for this project

Symptoms
- Flutter says: "CocoaPods not installed or not in valid state" or "installed but broken".
- iOS build/test fails with pod install errors.

Recommended fix (project-local)
1) Use Bundler to pin CocoaPods for this project
   - Install Bundler if needed: `gem install bundler`
   - From the project root: `cd ios`
   - Install gems: `bundle install`
   - Run pod install via bundler: `bundle exec pod install`

2) Make sure Xcode CLI tools are selected and licenses accepted
   - `xcode-select -p` should point to your Xcode app path
   - Open Xcode once and accept licenses/finish setup

3) Clean Flutter iOS artifacts
   - From project root: `flutter clean && flutter pub get`

4) Retry iOS run/test
   - Start simulator: `open -a Simulator`
   - Run: `scripts/run_integration_ios.sh`

System-wide alternative (if you prefer global CocoaPods)
- Uninstall and reinstall CocoaPods with the Ruby you actually use in your shell:
  - System Ruby: `sudo gem uninstall cocoapods && sudo gem install cocoapods`
  - Homebrew Ruby: `brew reinstall ruby && brew reinstall cocoapods`
  - rbenv/rvm: `rbenv global <ver> && gem install cocoapods && rbenv rehash`

Why this works
- Using Bundler ensures a consistent RubyGems environment and pins CocoaPods version (`ios/Gemfile`).
- Avoids mismatches between the Ruby used to install CocoaPods and the Ruby Flutter invokes.

