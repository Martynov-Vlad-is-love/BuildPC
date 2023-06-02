// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cooler.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cooler _$CoolerFromJson(Map<String, dynamic> json) => Cooler(
      json['id'] as int?,
      json['name'] as String,
      Producers.fromJson(json['producer'] as Map<String, dynamic>),
      CoolerSocket.fromJson(json['socket'] as Map<String, dynamic>),
      CoolerMaterial.fromJson(json['material'] as Map<String, dynamic>),
      json['maxTDP'] as int,
      json['supportedSockets'] as int,
      json['thermotubes'] as int,
      json['description'] as String,
      json['recommendedPrice'] as int,
      PerformanceLevel.fromJson(
          json['performanceLevel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CoolerToJson(Cooler instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'producer': instance.producer,
      'socket': instance.socket,
      'material': instance.material,
      'maxTDP': instance.maxTDP,
      'supportedSockets': instance.supportedSockets,
      'thermotubes': instance.thermotubes,
      'description': instance.description,
      'recommendedPrice': instance.recommendedPrice,
      'performanceLevel': instance.performanceLevel,
    };
