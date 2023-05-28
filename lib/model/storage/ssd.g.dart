// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ssd.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ssd _$SsdFromJson(Map<String, dynamic> json) => Ssd(
      json['id'] as int,
      Producers.fromJson(json['producer'] as Map<String, dynamic>),
      json['storageSize'] as int,
      StorageFormFactor.fromJson(json['formFactor'] as Map<String, dynamic>),
      StorageInterface.fromJson(
          json['storageInterface'] as Map<String, dynamic>),
      json['bufferSize'] as int,
      json['readingSpeed'] as int,
      json['writingSpeed'] as int,
      SsdCellsType.fromJson(json['cellsType'] as Map<String, dynamic>),
      json['description'] as String,
      json['recommendedPrice'] as int,
      PerformanceLevel.fromJson(
          json['performanceLevel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SsdToJson(Ssd instance) => <String, dynamic>{
      'id': instance.id,
      'producer': instance.producer,
      'storageSize': instance.storageSize,
      'formFactor': instance.formFactor,
      'storageInterface': instance.storageInterface,
      'bufferSize': instance.bufferSize,
      'readingSpeed': instance.readingSpeed,
      'writingSpeed': instance.writingSpeed,
      'cellsType': instance.cellsType,
      'description': instance.description,
      'recommendedPrice': instance.recommendedPrice,
      'performanceLevel': instance.performanceLevel,
    };
