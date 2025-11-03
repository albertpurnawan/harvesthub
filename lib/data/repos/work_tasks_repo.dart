import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:drift/drift.dart' show Value;
import '../drift/app_database.dart';
import '../constants/task_status.dart';
import '../../app/providers/global_providers.dart';

final workTasksRepoProvider = Provider<WorkTasksRepo>((ref) {
  final db = ref.watch(databaseProvider);
  return WorkTasksRepo(WorkTasksDao(db));
});

class WorkTasksRepo {
  final WorkTasksDao _dao;
  WorkTasksRepo(this._dao);

  Stream<List<WorkTask>> watchAll() => _dao.watchAllTasks();
  Stream<List<WorkTask>> watchByStatus(String status) => _dao.watchTasksByStatus(status);
  Stream<List<WorkTask>> watchOverdue() => _dao
      .watchAllTasks()
      .map((tasks) => tasks.where((t) => (t.dueDate != null && t.dueDate!.isBefore(DateTime.now()) && !t.isCompleted)).toList());

  Future<int> addTask({
    required int fieldId,
    required String typeCode,
    required DateTime dueDate,
    int? createdUserId,
    required int modifiedUserId,
    String status = kStatusOpen,
    String? taskName,
    String? instruction,
    String? attachmentUri,
  }) {
    final now = DateTime.now();
    return _dao.insertTask(WorkTasksCompanion.insert(
      farmFieldId: fieldId,
      workTaskTypeCode: typeCode,
      workTaskStatusCode: Value(status),
      startedDate: Value(now),
      dueDate: Value(dueDate),
      createdDate: Value(now),
      createdUserId: Value(createdUserId),
      modifiedDate: Value(now),
      modifiedUserId: Value(modifiedUserId),
      isCompleted: const Value(false),
      isDeleted: const Value(false),
      isStarted: const Value(false),
      isCancelled: const Value(false),
      taskName: Value(taskName),
      instruction: Value(instruction),
      attachmentUri: Value(attachmentUri),
    ));
  }

  Future<bool> startTask(WorkTask task, {DateTime? actionTime, int? actorUserId}) {
    final now = actionTime?.toUtc() ?? DateTime.now().toUtc();
    return _dao.updateTask(task.copyWith(
      isStarted: true,
      workTaskStatusCode: kStatusUnderway,
      startedDate: Value(now),
      modifiedDate: Value(now),
      modifiedUserId: Value(actorUserId ?? task.modifiedUserId ?? 1),
    ));
  }

  Future<bool> pauseTask(WorkTask task, {DateTime? actionTime, int? actorUserId}) {
    final now = actionTime?.toUtc() ?? DateTime.now().toUtc();
    return _dao.updateTask(task.copyWith(
      isStarted: false,
      workTaskStatusCode: kStatusOpen,
      modifiedDate: Value(now),
      modifiedUserId: Value(actorUserId ?? task.modifiedUserId ?? 1),
    ));
  }

  Future<bool> continueTask(WorkTask task, {DateTime? actionTime, int? actorUserId}) {
    final now = actionTime?.toUtc() ?? DateTime.now().toUtc();
    return _dao.updateTask(task.copyWith(
      isStarted: true,
      isCompleted: false,
      isCancelled: false,
      workTaskStatusCode: kStatusUnderway,
      startedDate: Value(now),
      modifiedDate: Value(now),
      modifiedUserId: Value(actorUserId ?? task.modifiedUserId ?? 1),
    ));
  }

  Future<bool> completeTask(WorkTask task, {DateTime? actionTime, int? actorUserId}) {
    final now = actionTime?.toUtc() ?? DateTime.now().toUtc();
    return _dao.updateTask(task.copyWith(
      isCompleted: true,
      workTaskStatusCode: kStatusComplete,
      modifiedDate: Value(now),
      modifiedUserId: Value(actorUserId ?? task.modifiedUserId ?? 1),
    ));
  }

  Future<bool> cancelTask(WorkTask task, {DateTime? actionTime, int? actorUserId}) {
    final now = actionTime?.toUtc() ?? DateTime.now().toUtc();
    return _dao.updateTask(task.copyWith(
      isCancelled: true,
      cancelledDate: Value(now),
      modifiedDate: Value(now),
      modifiedUserId: Value(actorUserId ?? task.modifiedUserId ?? 1),
    ));
  }
}
