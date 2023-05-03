// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gpu_to_technologies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GPUToTechnologies _$GPUToTechnologiesFromJson(Map<String, dynamic> json) =>
    GPUToTechnologies(
      json['id'] as int,
      GraphicCard.fromJson(json['graphicCard'] as Map<String, dynamic>),
      GPUTechnologies.fromJson(json['gpuTechnologies'] as Map<String, dynamic>),
      json['count'] as int,
    );

Map<String, dynamic> _$GPUToTechnologiesToJson(GPUToTechnologies instance) =>
    <String, dynamic>{
      'id': instance.id,
      'graphicCard': instance.graphicCard,
      'gpuTechnologies': instance.gpuTechnologies,
      'count': instance.count,
    };
