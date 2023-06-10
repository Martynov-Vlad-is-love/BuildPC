// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'processor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Processor _$ProcessorFromJson(Map<String, dynamic> json) => Processor(
      id: json['id'] as int?,
      name: json['name'] as String,
      producer: Producers.fromJson(json['producer'] as Map<String, dynamic>),
      yearOfRelease: json['yearOfRelease'] as int,
      socket:
          MotherboardSocket.fromJson(json['socket'] as Map<String, dynamic>),
      countOfCores: json['countOfCores'] as int,
      countOfThreads: json['countOfThreads'] as int,
      baseFrequency: (json['baseFrequency'] as num).toDouble(),
      turboFrequency: (json['turboFrequency'] as num).toDouble(),
      l3Cache: json['l3Cache'] as int,
      cpuGeneration:
          CPUGeneration.fromJson(json['cpuGeneration'] as Map<String, dynamic>),
      technicalProcess: json['technicalProcess'] as int,
      tdp: json['tdp'] as int,
      maxTemperature: json['maxTemperature'] as int,
      embeddedGraphic: json['embeddedGraphic'] as bool,
      pcieVersion:
          CPUPCIeVersion.fromJson(json['pcieVersion'] as Map<String, dynamic>),
      cpuTechnologies: (json['cpuTechnologies'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : CPUTechnologies.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String,
      recommendedPrice: json['recommendedPrice'] as int,
      performanceLevel: PerformanceLevel.fromJson(
          json['performanceLevel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProcessorToJson(Processor instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'producer': instance.producer,
      'socket': instance.socket,
      'yearOfRelease': instance.yearOfRelease,
      'countOfCores': instance.countOfCores,
      'countOfThreads': instance.countOfThreads,
      'baseFrequency': instance.baseFrequency,
      'turboFrequency': instance.turboFrequency,
      'l3Cache': instance.l3Cache,
      'cpuGeneration': instance.cpuGeneration,
      'technicalProcess': instance.technicalProcess,
      'tdp': instance.tdp,
      'maxTemperature': instance.maxTemperature,
      'embeddedGraphic': instance.embeddedGraphic,
      'pcieVersion': instance.pcieVersion,
      'cpuTechnologies': instance.cpuTechnologies,
      'description': instance.description,
      'recommendedPrice': instance.recommendedPrice,
      'performanceLevel': instance.performanceLevel,
    };
