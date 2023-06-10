// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'power_supply.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PowerSupply _$PowerSupplyFromJson(Map<String, dynamic> json) => PowerSupply(
      id: json['id'] as int?,
      name: json['name'] as String,
      producer: Producers.fromJson(json['producer'] as Map<String, dynamic>),
      power: json['power'] as int,
      formFactor:
          FormFactor.fromJson(json['formFactor'] as Map<String, dynamic>),
      pfcModule: json['pfcModule'] as bool,
      modularConnection: json['modularConnection'] as bool,
      protectionFunctions: (json['protectionFunctions'] as List<dynamic>)
          .map((e) => PowerSupplyProtectionFunctions.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      cpu_4pin: json['cpu_4pin'] as int,
      cpu_4plus4pin: json['cpu_4plus4pin'] as int,
      cpu_8pin: json['cpu_8pin'] as int,
      pcie_6plus2pin: json['pcie_6plus2pin'] as int,
      pcie_8pin: json['pcie_8pin'] as int,
      pcie_5_16pin: json['pcie_5_16pin'] as int,
      sata: json['sata'] as int,
      countOf_12VLines: json['count_of_12_v_lines'] as int,
      description: json['description'] as String,
      recommendedPrice: json['recommendedPrice'] as int,
      performanceLevel: PerformanceLevel.fromJson(
          json['performanceLevel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PowerSupplyToJson(PowerSupply instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'producer': instance.producer,
      'power': instance.power,
      'formFactor': instance.formFactor,
      'pfcModule': instance.pfcModule,
      'modularConnection': instance.modularConnection,
      'protectionFunctions': instance.protectionFunctions,
      'cpu_4pin': instance.cpu_4pin,
      'cpu_4plus4pin': instance.cpu_4plus4pin,
      'cpu_8pin': instance.cpu_8pin,
      'pcie_6plus2pin': instance.pcie_6plus2pin,
      'pcie_8pin': instance.pcie_8pin,
      'pcie_5_16pin': instance.pcie_5_16pin,
      'sata': instance.sata,
      'count_of_12_v_lines': instance.countOf_12VLines,
      'description': instance.description,
      'recommendedPrice': instance.recommendedPrice,
      'performanceLevel': instance.performanceLevel,
    };
