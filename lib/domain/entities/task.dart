import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
class TaskEntity with _$TaskEntity {
  const factory TaskEntity({
    required int id,
    required int fieldId,
    required String typeCode,
    required String status,
    DateTime? dueDate,
    DateTime? startedDate,
    DateTime? cancelledDate,
    required bool isCompleted,
    required bool isStarted,
    required bool isCancelled,
  }) = _TaskEntity;

  factory TaskEntity.fromJson(Map<String, dynamic> json) => _$TaskEntityFromJson(json);
}

