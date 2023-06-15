// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'case.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Case _$CaseFromJson(Map<String, dynamic> json) => Case(
      id: json['id'] as int?,
      name: json['name'] as String?,
      size: json['size'] == null
          ? null
          : CaseSize.fromJson(json['size'] as Map<String, dynamic>),
      formFactor: (json['formFactor'] as List<dynamic>)
          .map((e) =>
              e == null ? null : FormFactor.fromJson(e as Map<String, dynamic>))
          .toList(),
      producer: json['producer'] == null
          ? null
          : Producers.fromJson(json['producer'] as Map<String, dynamic>),
      powerSupplyLocation: json['powerSupplyLocation'] == null
          ? null
          : CasePowerSupplyLocation.fromJson(
              json['powerSupplyLocation'] as Map<String, dynamic>),
      fansIncluded: json['fansIncluded'] as bool?,
      usb_3_2: json['usb_3_2'] as int?,
      usb_3_0: json['usb_3_0'] as int?,
      usb_2_0: json['usb_2_0'] as int?,
      designFeatures: (json['designFeatures'] as List<dynamic>)
          .map((e) => e == null
              ? null
              : CaseDesignFeatures.fromJson(e as Map<String, dynamic>))
          .toList(),
      maxLengthOfGraphicCard: json['maxLengthOfGraphicCard'] as int?,
      description: json['description'] as String?,
      recommendedPrice: json['recommendedPrice'] as int?,
      performanceLevel: json['performanceLevel'] == null
          ? null
          : PerformanceLevel.fromJson(
              json['performanceLevel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CaseToJson(Case instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'size': instance.size,
      'producer': instance.producer,
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
