#!/usr/bin/env bash
set -euo pipefail

# Runs Flutter integration tests targeting web (Chrome).
# Usage:
#   bash scripts/run_integration_web.sh

echo "[Web] Running widget E2E tests on Chrome..."
# Note: Flutter integration_test is not supported on web devices yet.
# We mirror the E2E flow as a widget test and run it on Chrome.
flutter test --platform chrome test/web_app_flow_test.dart
echo "[Web] Widget E2E tests finished."
