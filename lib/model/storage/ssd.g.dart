// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ssd.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ssd _$SsdFromJson(Map<String, dynamic> json) => Ssd(
      id: json['id'] as int?,
      producer: Producers.fromJson(json['producer'] as Map<String, dynamic>),
      storageSize: json['storageSize'] as int,
      formFactor: StorageFormFactor.fromJson(
          json['formFactor'] as Map<String, dynamic>),
      storageInterface: StorageInterface.fromJson(
          json['storageInterface'] as Map<String, dynamic>),
      bufferSize: json['bufferSize'] as int,
      readingSpeed: json['readingSpeed'] as int,
      writingSpeed: json['writingSpeed'] as int,
      cellsType:
          SsdCellsType.fromJson(json['cellsType'] as Map<String, dynamic>),
      description: json['description'] as String,
      recommendedPrice: json['recommendedPrice'] as int,
      performanceLevel: PerformanceLevel.fromJson(
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
