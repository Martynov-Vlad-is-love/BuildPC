// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cooler.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cooler _$CoolerFromJson(Map<String, dynamic> json) => Cooler(
      json['id'] as int,
      json['name'] as int,
      CoolerProducer.fromJson(json['producer'] as Map<String, dynamic>),
      CoolerSocket.fromJson(json['socket'] as Map<String, dynamic>),
      json['connector'] as int,
      CoolerMaterial.fromJson(json['material'] as Map<String, dynamic>),
      json['maxTDP'] as int,
      json['supportedSockets'] as int,
      json['thermotubes'] as int,
    );

Map<String, dynamic> _$CoolerToJson(Cooler instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'producer': instance.producer,
      'socket': instance.socket,
      'material': instance.material,
      'connector': instance.connector,
      'maxTDP': instance.maxTDP,
      'supportedSockets': instance.supportedSockets,
      'thermotubes': instance.thermotubes,
    };
