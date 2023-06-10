// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hdd.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hdd _$HddFromJson(Map<String, dynamic> json) => Hdd(
      id: json['id'] as int?,
      producer: Producers.fromJson(json['producer'] as Map<String, dynamic>),
      storageSize: json['storageSize'] as int,
      speed: json['speed'] as int,
      formFactor: StorageFormFactor.fromJson(
          json['formFactor'] as Map<String, dynamic>),
      storageInterface: StorageInterface.fromJson(
          json['storageInterface'] as Map<String, dynamic>),
      bufferSize: json['bufferSize'] as int,
      readingSpeed: json['readingSpeed'] as int,
      writingSpeed: json['writingSpeed'] as int,
      description: json['description'] as String,
      recommendedPrice: json['recommendedPrice'] as int,
      performanceLevel: PerformanceLevel.fromJson(
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
