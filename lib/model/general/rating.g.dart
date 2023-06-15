// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rating _$RatingFromJson(Map<String, dynamic> json) => Rating(
      id: json['id'] as int?,
      buildPc: json['buildPc'] == null
          ? null
          : BuildPC.fromJson(json['buildPc'] as Map<String, dynamic>),
      like: (json['like'] as List<dynamic>)
          .map((e) =>
              e == null ? null : Like.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RatingToJson(Rating instance) => <String, dynamic>{
      'id': instance.id,
      'buildPc': instance.buildPc,
      'like': instance.like,
    };
