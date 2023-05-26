// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hdd.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hdd _$HddFromJson(Map<String, dynamic> json) => Hdd(
      json['id'] as int,
      Producers.fromJson(json['producer'] as Map<String, dynamic>),
      json['storageSize'] as int,
      json['speed'] as int,
      StorageFormFactor.fromJson(json['formFactor'] as Map<String, dynamic>),
      StorageInterface.fromJson(
          json['storageInterface'] as Map<String, dynamic>),
      json['bufferSize'] as int,
      json['readingSpeed'] as int,
      json['writingSpeed'] as int,
      json['description'] as String,
      json['recommendedPrice'] as int,
      PerformanceLevel.fromJson(
          json['performanceLevel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HddToJson(Hdd instance) => <String, dynamic>{
      'id': instance.id,
      'producer': instance.producer,
      'storageSize': instance.storageSize,
      'speed': instance.speed,
      'formFactor': instance.formFactor,
      'storageInterface': instance.storageInterface,
      'bufferSize': instance.bufferSize,
      'readingSpeed': instance.readingSpeed,
      'writingSpeed': instance.writingSpeed,
      'description': instance.description,
      'recommendedPrice': instance.recommendedPrice,
      'performanceLevel': instance.performanceLevel,
    };
