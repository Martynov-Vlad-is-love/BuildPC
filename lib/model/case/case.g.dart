// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'case.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Case _$CaseFromJson(Map<String, dynamic> json) => Case(
      json['id'] as int?,
      json['name'] as String,
      CaseSize.fromJson(json['size'] as Map<String, dynamic>),
      (json['formFactor'] as List<dynamic>)
          .map((e) => FormFactor.fromJson(e as Map<String, dynamic>))
          .toList(),
      Producers.fromJson(json['producer'] as Map<String, dynamic>),
      CasePowerSupplyLocation.fromJson(
          json['powerSupplyLocation'] as Map<String, dynamic>),
      json['usb_3_2'] as int,
      json['usb_3_0'] as int,
      json['usb_2_0'] as int,
      (json['designFeatures'] as List<dynamic>)
          .map((e) => CaseDesignFeatures.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['maxLengthOfGraphicCard'] as int,
      json['description'] as String,
      json['recommendedPrice'] as int,
      PerformanceLevel.fromJson(
          json['performanceLevel'] as Map<String, dynamic>),
      fansIncluded: json['fansIncluded'] as bool,
    );

Map<String, dynamic> _$CaseToJson(Case instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'producer': instance.producer,
      'size': instance.size,
      'formFactor': instance.formFactor,
      'powerSupplyLocation': instance.powerSupplyLocation,
      'fansIncluded': instance.fansIncluded,
      'usb_3_2': instance.usb_3_2,
      'usb_3_0': instance.usb_3_0,
      'usb_2_0': instance.usb_2_0,
      'designFeatures': instance.designFeatures,
      'maxLengthOfGraphicCard': instance.maxLengthOfGraphicCard,
      'description': instance.description,
      'recommendedPrice': instance.recommendedPrice,
      'performanceLevel': instance.performanceLevel,
    };
