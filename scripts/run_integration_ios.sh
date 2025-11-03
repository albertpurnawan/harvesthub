#!/usr/bin/env bash
set -euo pipefail

# Helper to run the Flutter integration test on iOS simulator/device.
# Usage:
#   bash scripts/run_integration_ios.sh [<device_id>]
#   scripts/run_integration_ios.sh -d <device_id>
#
# Environment overrides:
#   DRIVER=test_driver/integration_test.dart
#   TARGET=integration_test/app_flow_test.dart

DRIVER_DEFAULT="test_driver/integration_test.dart"
TARGET_DEFAULT="integration_test/app_flow_test.dart"

DRIVER="${DRIVER:-$DRIVER_DEFAULT}"
TARGET="${TARGET:-$TARGET_DEFAULT}"

DEVICE=""
if [[ "${1:-}" == "-d" || "${1:-}" == "--device" ]]; then
  DEVICE="${2:-}"
  shift || true
  shift || true
elif [[ "${1:-}" != "" ]]; then
  DEVICE="${1}"
  shift || true
fi

if [[ ! -f "$DRIVER" ]]; then
  echo "[!] Driver file not found: $DRIVER" >&2
  exit 1
fi
if [[ ! -f "$TARGET" ]]; then
  echo "[!] Target test file not found: $TARGET" >&2
  exit 1
fi

echo "[*] Ensuring dependencies (flutter pub get)"
flutter pub get 1>/dev/null

if [[ -z "$DEVICE" ]]; then
  echo "[*] Detecting an iOS simulator/device..."
  # Parse flutter devices output to find the first iOS device id
  # The format is: <name> • <id> • ios • ...
  DEVICE=$(flutter devices | awk -F '•' 'tolower($0) ~ / ios / {gsub(/^[ \t]+|[ \t]+$/, "", $2); print $2; exit}') || true
fi

if [[ -z "$DEVICE" ]]; then
  echo "[!] No iOS device found. Start a simulator (open -a Simulator) or use: flutter emulators --launch <id>." >&2
  flutter devices || true
  exit 2
fi

echo "[*] Running integration test on iOS device: $DEVICE"
set -x
flutter drive --driver="$DRIVER" --target="$TARGET" -d "$DEVICE" "$@"
set +x

