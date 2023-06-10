// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ram.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ram _$RamFromJson(Map<String, dynamic> json) => Ram(
      id: json['id'] as int?,
      name: json['name'] as String,
      producer: Producers.fromJson(json['producer'] as Map<String, dynamic>),
      memoryType:
          RamMemoryType.fromJson(json['memoryType'] as Map<String, dynamic>),
      memoryCapacity: json['memoryCapacity'] as int,
      frequency: json['frequency'] as int,
      timings: RamTimings.fromJson(json['timings'] as Map<String, dynamic>),
      powerSupplyVoltage: (json['powerSupplyVoltage'] as num).toDouble(),
      description: json['description'] as String,
      recommendedPrice: json['recommendedPrice'] as int,
      performanceLevel: PerformanceLevel.fromJson(
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
