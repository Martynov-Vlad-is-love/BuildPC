// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cooler.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cooler _$CoolerFromJson(Map<String, dynamic> json) => Cooler(
      id: json['id'] as int?,
      name: json['name'] as String,
      producer: Producers.fromJson(json['producer'] as Map<String, dynamic>),
      socket: (json['socket'] as List<dynamic>)
          .map((e) => CoolerSocket.fromJson(e as Map<String, dynamic>))
          .toList(),
      material:
          CoolerMaterial.fromJson(json['material'] as Map<String, dynamic>),
      maxTdp: json['maxTdp'] as int,
      supportedSockets: json['supportedSockets'] as int,
      thermalTubes: json['thermalTubes'] as int,
      description: json['description'] as String,
      recommendedPrice: json['recommendedPrice'] as int,
      performanceLevel: PerformanceLevel.fromJson(
          json['performanceLevel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CoolerToJson(Cooler instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'producer': instance.producer,
      'socket': instance.socket,
      'material': instance.material,
      'maxTdp': instance.maxTdp,
      'supportedSockets': instance.supportedSockets,
      'thermalTubes': instance.thermalTubes,
      'description': instance.description,
      'recommendedPrice': instance.recommendedPrice,
      'performanceLevel': instance.performanceLevel,
    };
