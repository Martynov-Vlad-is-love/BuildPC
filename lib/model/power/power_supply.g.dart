// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'power_supply.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PowerSupply _$PowerSupplyFromJson(Map<String, dynamic> json) => PowerSupply(
      json['id'] as int,
      json['name'] as String,
      PowerSupplyProducer.fromJson(json['producer'] as Map<String, dynamic>),
      json['power'] as int,
      FormFactor.fromJson(json['formFactor'] as Map<String, dynamic>),
      json['performanceLevelClass'] as int,
      PowerSupplyProtectionFunctions.fromJson(
          json['protectionFunctions'] as Map<String, dynamic>),
      json['cpu4pin'] as int,
      json['cpu4_4pin'] as int,
      json['cpu8pin'] as int,
      json['pciE6_2pin'] as int,
      json['pciE8pin'] as int,
      json['pciEv5_16pin'] as int,
      json['sata'] as int,
      json['countOf12VLines'] as int,
      json['description'] as String,
      json['recommendedPrice'] as int,
      pfcModule: json['pfcModule'] as bool,
      modularConnection: json['modularConnection'] as bool,
    );

Map<String, dynamic> _$PowerSupplyToJson(PowerSupply instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'producer': instance.producer,
      'power': instance.power,
      'formFactor': instance.formFactor,
      'performanceLevelClass': instance.performanceLevelClass,
      'pfcModule': instance.pfcModule,
      'modularConnection': instance.modularConnection,
      'protectionFunctions': instance.protectionFunctions,
      'cpu4pin': instance.cpu4pin,
      'cpu4_4pin': instance.cpu4_4pin,
      'cpu8pin': instance.cpu8pin,
      'pciE6_2pin': instance.pciE6_2pin,
      'pciE8pin': instance.pciE8pin,
      'pciEv5_16pin': instance.pciEv5_16pin,
      'sata': instance.sata,
      'countOf12VLines': instance.countOf12VLines,
      'description': instance.description,
      'recommendedPrice': instance.recommendedPrice,
    };
