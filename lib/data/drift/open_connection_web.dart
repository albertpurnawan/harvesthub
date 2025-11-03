import 'package:drift/drift.dart';
import 'package:drift/web.dart';

QueryExecutor openConnection() {
  // Force IndexedDB to avoid sql.js requirement in headless Chrome tests
  return WebDatabase.withStorage(
    DriftWebStorage.indexedDb('harvesthub'),
  );
}
