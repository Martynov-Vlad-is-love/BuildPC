// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'build_pc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BuildPC _$BuildPCFromJson(Map<String, dynamic> json) => BuildPC(
      id: json['id'] as int?,
      nameOfBuild: json['nameOfBuild'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      motherboard: json['motherboard'] == null
          ? null
          : Motherboard.fromJson(json['motherboard'] as Map<String, dynamic>),
      processor: json['processor'] == null
          ? null
          : Processor.fromJson(json['processor'] as Map<String, dynamic>),
      graphicCard: json['graphicCard'] == null
          ? null
          : GraphicCard.fromJson(json['graphicCard'] as Map<String, dynamic>),
      ram: (json['ram'] as List<dynamic>)
          .map(
              (e) => e == null ? null : Ram.fromJson(e as Map<String, dynamic>))
          .toList(),
      powerSupply: json['powerSupply'] == null
          ? null
          : PowerSupply.fromJson(json['powerSupply'] as Map<String, dynamic>),
      hdd: (json['hdd'] as List<dynamic>)
          .map(
              (e) => e == null ? null : Hdd.fromJson(e as Map<String, dynamic>))
          .toList(),
      ssd: (json['ssd'] as List<dynamic>)
          .map(
              (e) => e == null ? null : Ssd.fromJson(e as Map<String, dynamic>))
          .toList(),
      pcCase: json['pcCase'] == null
          ? null
          : Case.fromJson(json['pcCase'] as Map<String, dynamic>),
      cooler: json['cooler'] == null
          ? null
          : Cooler.fromJson(json['cooler'] as Map<String, dynamic>),
      countOfLikes: json['countOfLikes'] as int?,
      ratingId: json['ratingId'] == null
          ? null
          : Rating.fromJson(json['ratingId'] as Map<String, dynamic>),
      totalPrice: json['totalPrice'] as int?,
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
      'totalPrice': instance.totalPrice,
    };
