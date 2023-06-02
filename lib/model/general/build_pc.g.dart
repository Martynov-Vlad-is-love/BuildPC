// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'build_pc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BuildPC _$BuildPCFromJson(Map<String, dynamic> json) => BuildPC(
      json['id'] as int?,
      json['nameOfBuild'] as String,
      User.fromJson(json['user'] as Map<String, dynamic>),
      Motherboard.fromJson(json['motherboard'] as Map<String, dynamic>),
      Processor.fromJson(json['processor'] as Map<String, dynamic>),
      GraphicCard.fromJson(json['graphicCard'] as Map<String, dynamic>),
      (json['ram'] as List<dynamic>)
          .map((e) => Ram.fromJson(e as Map<String, dynamic>))
          .toList(),
      PowerSupply.fromJson(json['powerSupply'] as Map<String, dynamic>),
      (json['hdd'] as List<dynamic>)
          .map((e) => Hdd.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['ssd'] as List<dynamic>)
          .map((e) => Ssd.fromJson(e as Map<String, dynamic>))
          .toList(),
      Case.fromJson(json['pcCase'] as Map<String, dynamic>),
      Cooler.fromJson(json['cooler'] as Map<String, dynamic>),
      json['countOfLikes'] as int,
      Rating.fromJson(json['ratingId'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BuildPCToJson(BuildPC instance) => <String, dynamic>{
      'id': instance.id,
      'nameOfBuild': instance.nameOfBuild,
      'user': instance.user,
      'motherboard': instance.motherboard,
      'processor': instance.processor,
      'graphicCard': instance.graphicCard,
      'ram': instance.ram,
      'powerSupply': instance.powerSupply,
      'hdd': instance.hdd,
      'ssd': instance.ssd,
      'pcCase': instance.pcCase,
      'cooler': instance.cooler,
      'countOfLikes': instance.countOfLikes,
      'ratingId': instance.ratingId,
    };
