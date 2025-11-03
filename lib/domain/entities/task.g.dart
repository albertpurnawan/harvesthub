// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskEntityImpl _$$TaskEntityImplFromJson(Map<String, dynamic> json) =>
    _$TaskEntityImpl(
      id: (json['id'] as num).toInt(),
      fieldId: (json['fieldId'] as num).toInt(),
      typeCode: json['typeCode'] as String,
      status: json['status'] as String,
      dueDate: json['dueDate'] == null
          ? null
          : DateTime.parse(json['dueDate'] as String),
      startedDate: json['startedDate'] == null
          ? null
          : DateTime.parse(json['startedDate'] as String),
      cancelledDate: json['cancelledDate'] == null
          ? null
          : DateTime.parse(json['cancelledDate'] as String),
      isCompleted: json['isCompleted'] as bool,
      isStarted: json['isStarted'] as bool,
      isCancelled: json['isCancelled'] as bool,
    );

Map<String, dynamic> _$$TaskEntityImplToJson(_$TaskEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fieldId': instance.fieldId,
      'typeCode': instance.typeCode,
      'status': instance.status,
      'dueDate': instance.dueDate?.toIso8601String(),
      'startedDate': instance.startedDate?.toIso8601String(),
      'cancelledDate': instance.cancelledDate?.toIso8601String(),
      'isCompleted': instance.isCompleted,
      'isStarted': instance.isStarted,
      'isCancelled': instance.isCancelled,
    };
