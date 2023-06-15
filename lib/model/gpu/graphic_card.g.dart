// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graphic_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GraphicCard _$GraphicCardFromJson(Map<String, dynamic> json) => GraphicCard(
      id: json['id'] as int?,
      producer: json['producer'] == null
          ? null
          : Producers.fromJson(json['producer'] as Map<String, dynamic>),
      name: json['name'] as String?,
      vendor: json['vendor'] == null
          ? null
          : Producers.fromJson(json['vendor'] as Map<String, dynamic>),
      year: json['year'] as int?,
      technicalProcess: json['technicalProcess'] as int?,
      gpuFrequency: json['gpuFrequency'] as int?,
      memoryAmount: json['memoryAmount'] as int?,
      memoryType: json['memoryType'] == null
          ? null
          : GPUMemoryType.fromJson(json['memoryType'] as Map<String, dynamic>),
      memoryFrequency: json['memoryFrequency'] as int?,
      bus: json['bus'] as int?,
      tdp: json['tdp'] as int?,
      connector: (json['connector'] as List<dynamic>)
          .map((e) => e == null
              ? null
              : GPUConnector.fromJson(e as Map<String, dynamic>))
          .toList(),
      interfaceType: json['interfaceType'] == null
          ? null
          : GPUInterfaceType.fromJson(
              json['interfaceType'] as Map<String, dynamic>),
      length: json['length'] as int?,
      description: json['description'] as String?,
      gpuTechnologies: json['gpuTechnologies'] == null
          ? null
          : GPUTechnologies.fromJson(
              json['gpuTechnologies'] as Map<String, dynamic>),
      recommendedPrice: json['recommendedPrice'] as int?,
      performanceLevel: json['performanceLevel'] == null
          ? null
          : PerformanceLevel.fromJson(
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
