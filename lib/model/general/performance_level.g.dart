// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'performance_level.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PerformanceLevel _$PerformanceLevelFromJson(Map<String, dynamic> json) =>
    PerformanceLevel(
      json['id'] as int?,
      level: json['level'] as String,
    );

Map<String, dynamic> _$PerformanceLevelToJson(PerformanceLevel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'level': instance.level,
    };
