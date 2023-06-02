// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graphic_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GraphicCard _$GraphicCardFromJson(Map<String, dynamic> json) => GraphicCard(
      json['id'] as int?,
      Producers.fromJson(json['producer'] as Map<String, dynamic>),
      json['name'] as String,
      Producers.fromJson(json['vendor'] as Map<String, dynamic>),
      json['year'] as int,
      json['technicalProcess'] as int,
      json['gpuFrequency'] as int,
      json['memoryAmount'] as int,
      GPUMemoryType.fromJson(json['memoryType'] as Map<String, dynamic>),
      json['memoryFrequency'] as int,
      json['bus'] as int,
      json['tdp'] as int,
      (json['connector'] as List<dynamic>)
          .map((e) => GPUConnector.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['length'] as int,
      GPUInterfaceType.fromJson(json['interfaceType'] as Map<String, dynamic>),
      json['description'] as String,
      json['recommendedPrice'] as int,
      GPUTechnologies.fromJson(json['gpuTechnologies'] as Map<String, dynamic>),
      PerformanceLevel.fromJson(
          json['performanceLevel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GraphicCardToJson(GraphicCard instance) =>
    <String, dynamic>{
      'id': instance.id,
      'producer': instance.producer,
      'name': instance.name,
      'vendor': instance.vendor,
      'year': instance.year,
      'technicalProcess': instance.technicalProcess,
      'gpuFrequency': instance.gpuFrequency,
      'memoryAmount': instance.memoryAmount,
      'memoryType': instance.memoryType,
      'memoryFrequency': instance.memoryFrequency,
      'bus': instance.bus,
      'tdp': instance.tdp,
      'connector': instance.connector,
      'interfaceType': instance.interfaceType,
      'length': instance.length,
      'description': instance.description,
      'gpuTechnologies': instance.gpuTechnologies,
      'recommendedPrice': instance.recommendedPrice,
      'performanceLevel': instance.performanceLevel,
    };
