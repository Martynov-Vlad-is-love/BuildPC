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
      PerformanceLevel.fromJson(
          json['performanceLevel'] as Map<String, dynamic>),
      (json['protectionFunctions'] as List<dynamic>)
          .map((e) => PowerSupplyProtectionFunctions.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      json['cpu_4pin'] as int,
      json['cpu_4plus4pin'] as int,
      json['cpu_8pin'] as int,
      json['pcie_6plus2pin'] as int,
      json['pcie_8pin'] as int,
      json['pcie_5_16pin'] as int,
      json['sata'] as int,
      json['count_of_12_v_lines'] as int,
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
      'performanceLevel': instance.performanceLevel,
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
      'count_of_12_v_lines': instance.count_of_12_v_lines,
      'description': instance.description,
      'recommendedPrice': instance.recommendedPrice,
    };
