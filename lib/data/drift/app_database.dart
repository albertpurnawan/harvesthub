import 'package:drift/drift.dart';
import 'package:harvesthub_mobile/data/constants/task_status.dart' as status;
import 'open_connection_io.dart' if (dart.library.html) 'open_connection_web.dart';
part 'tables/farmsites.dart';
part 'tables/farmfields.dart';
part 'tables/worktasks.dart';
part 'tables/worktasktypes.dart';
part 'tables/crops.dart';
part 'tables/users.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [
  FarmSites, FarmFields, WorkTasks, WorkTaskTypes, Crops, Users,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(openConnection());

  AppDatabase.forTesting(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
          await customStatement('PRAGMA foreign_keys = ON');
          await customStatement('CREATE INDEX IF NOT EXISTS idx_farmfields_site ON farm_fields (farm_site_id)');
          await customStatement('CREATE INDEX IF NOT EXISTS idx_worktasks_status ON work_tasks (work_task_status_code)');
          await customStatement('CREATE INDEX IF NOT EXISTS idx_worktasks_due ON work_tasks (due_date)');
          await customStatement('CREATE INDEX IF NOT EXISTS idx_worktasks_field ON work_tasks (farm_field_id)');
          await customStatement('CREATE INDEX IF NOT EXISTS idx_users_site ON users (farm_site_id)');
          await customStatement('CREATE INDEX IF NOT EXISTS idx_users_status ON users (user_status)');
          await customStatement('CREATE INDEX IF NOT EXISTS idx_farmsites_default_crop ON farm_sites (default_primary_crop_id)');
        },
        onUpgrade: (m, from, to) async {
          await customStatement('PRAGMA foreign_keys = ON');
          if (from < 2) {
          }
        },
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON');
        },
      );
}
