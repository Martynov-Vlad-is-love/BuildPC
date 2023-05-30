// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'processor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Processor _$ProcessorFromJson(Map<String, dynamic> json) => Processor(
      json['id'] as int,
      json['name'] as String,
      Producers.fromJson(json['producer'] as Map<String, dynamic>),
      json['yearOfRelease'] as int,
      MotherboardSocket.fromJson(json['socket'] as Map<String, dynamic>),
      json['countOfCores'] as int,
      json['countOfThreads'] as int,
      (json['baseFrequency'] as num).toDouble(),
      (json['turboBoostFrequency'] as num).toDouble(),
      json['l3Cache'] as int,
      CPUGeneration.fromJson(json['generation'] as Map<String, dynamic>),
      json['technicalProcess'] as int,
      json['tdp'] as int,
      json['maxTemperature'] as int,
      CPUPCIeVersion.fromJson(json['pcieVersion'] as Map<String, dynamic>),
      CPUTechnologies.fromJson(json['technologies'] as Map<String, dynamic>),
      json['description'] as String,
      embeddedGraphics: json['embeddedGraphics'] as bool,
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
      'turboBoostFrequency': instance.turboBoostFrequency,
      'l3Cache': instance.l3Cache,
      'generation': instance.generation,
      'technicalProcess': instance.technicalProcess,
      'tdp': instance.tdp,
      'maxTemperature': instance.maxTemperature,
      'embeddedGraphics': instance.embeddedGraphics,
      'pcieVersion': instance.pcieVersion,
      'technologies': instance.technologies,
      'description': instance.description,
    };
