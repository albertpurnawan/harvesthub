TestSprite quick start for HarvestHub (Flutter)

Prereqs
- Flutter installed and able to run on Chrome
- TestSprite MCP server installed and configured in your IDE (Cursor/VS Code) or CLI

1) Run the app on the Web
- `flutter pub get`
- `flutter run -d chrome --web-port 8080`

2) Configure TestSprite MCP (example)
- Add this to your MCP client config (e.g., settings.json):

  {
    "mcpServers": {
      "testsprite": {
        "command": "testsprite",
        "args": ["serve"],
        "disabled": false
      }
    }
  }

3) Use the scenario(s)
- Web: open `testsprite/scenarios/login_and_tasks.yaml`
  - Adjust `target.url` if you use a different port
  - Run via your TestSprite client
- Mobile (Android): open `testsprite/scenarios/mobile_login_and_tasks.yaml`
  - Ensure the app is built and installed on emulator/device
  - Package id: `com.example.harvesthub_mobile` (see `android/app/build.gradle.kts`)
  - Run via your TestSprite client against the connected device

4) What’s covered
- Login with seeded `admin/admin`
- Navigate to Tasks
- Create a new Task and verify it appears
- Open Profile from app bar and logout

Notes
- Stable selectors added: FAB tooltip `Create Task`, app bar action tooltip `Profile`
- Scenarios rely on visible labels (Username, Password, Login, Task Type, Field, Save Task)
- If selectors are flaky in your environment, consider adding `ValueKey` to critical widgets and update scenarios accordingly
5) Android integration test
- Ensure an emulator/device is connected: `flutter devices`
- Run: `scripts/run_integration_android.sh`
  - Optional: pass device id: `scripts/run_integration_android.sh emulator-5554`
  - Overrides: `DRIVER` (default `test_driver/integration_test.dart`), `TARGET` (default `integration_test/app_flow_test.dart`)
