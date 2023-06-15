// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ssd.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ssd _$SsdFromJson(Map<String, dynamic> json) => Ssd(
      id: json['id'] as int?,
      producer: json['producer'] == null
          ? null
          : Producers.fromJson(json['producer'] as Map<String, dynamic>),
      name: json['name'] as String?,
      storageSize: json['storageSize'] as int?,
      formFactor: json['formFactor'] == null
          ? null
          : StorageFormFactor.fromJson(
              json['formFactor'] as Map<String, dynamic>),
      storageInterface: json['storageInterface'] == null
          ? null
          : StorageInterface.fromJson(
              json['storageInterface'] as Map<String, dynamic>),
      bufferSize: json['bufferSize'] as int?,
      readingSpeed: json['readingSpeed'] as int?,
      writingSpeed: json['writingSpeed'] as int?,
      cellsType: json['cellsType'] == null
          ? null
          : SsdCellsType.fromJson(json['cellsType'] as Map<String, dynamic>),
      description: json['description'] as String?,
      recommendedPrice: json['recommendedPrice'] as int?,
      performanceLevel: json['performanceLevel'] == null
          ? null
          : PerformanceLevel.fromJson(
              json['performanceLevel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SsdToJson(Ssd instance) => <String, dynamic>{
      'id': instance.id,
      'producer': instance.producer,
      'name': instance.name,
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
