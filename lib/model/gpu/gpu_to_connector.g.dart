// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gpu_to_connector.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GPUToConnector _$GPUToConnectorFromJson(Map<String, dynamic> json) =>
    GPUToConnector(
      json['id'] as int,
      GraphicCard.fromJson(json['graphicCard'] as Map<String, dynamic>),
      GPUConnector.fromJson(json['gpuConnector'] as Map<String, dynamic>),
      json['count'] as int,
    );

Map<String, dynamic> _$GPUToConnectorToJson(GPUToConnector instance) =>
    <String, dynamic>{
      'id': instance.id,
      'graphicCard': instance.graphicCard,
      'gpuConnector': instance.gpuConnector,
      'count': instance.count,
    };
