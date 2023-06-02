// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ram.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ram _$RamFromJson(Map<String, dynamic> json) => Ram(
      json['id'] as int?,
      json['name'] as String,
      Producers.fromJson(json['producer'] as Map<String, dynamic>),
      RamMemoryType.fromJson(json['memoryType'] as Map<String, dynamic>),
      json['memoryCapacity'] as int,
      json['frequency'] as int,
      RamTimings.fromJson(json['timings'] as Map<String, dynamic>),
      (json['powerSupplyVoltage'] as num).toDouble(),
      json['description'] as String,
      json['recommendedPrice'] as int,
      PerformanceLevel.fromJson(
          json['performanceLevel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RamToJson(Ram instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'producer': instance.producer,
      'memoryType': instance.memoryType,
      'memoryCapacity': instance.memoryCapacity,
      'frequency': instance.frequency,
      'timings': instance.timings,
      'powerSupplyVoltage': instance.powerSupplyVoltage,
      'description': instance.description,
      'recommendedPrice': instance.recommendedPrice,
      'performanceLevel': instance.performanceLevel,
    };
