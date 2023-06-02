// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'motherboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Motherboard _$MotherboardFromJson(Map<String, dynamic> json) => Motherboard(
      json['id'] as int?,
      json['name'] as String,
      Producers.fromJson(json['producer'] as Map<String, dynamic>),
      MotherboardSocket.fromJson(json['socket'] as Map<String, dynamic>),
      (json['cpuGeneration'] as List<dynamic>)
          .map((e) => CPUGeneration.fromJson(e as Map<String, dynamic>))
          .toList(),
      MotherboardChipset.fromJson(json['chipset'] as Map<String, dynamic>),
      FormFactor.fromJson(json['formFactor'] as Map<String, dynamic>),
      json['maxTdpOfProcessors'] as int,
      json['memorySlots'] as int,
      json['supportedMemoryFrequency'] as int,
      json['maxAmountOfRam'] as int,
      MotherboardNetwork.fromJson(json['network'] as Map<String, dynamic>),
      json['pciExpressX16'] as int,
      json['pciExpressX4'] as int,
      json['pciExpressX1'] as int,
      json['sata3'] as int,
      json['m2'] as int,
      json['dSub'] as int,
      json['dvi'] as int,
      json['hdmi'] as int,
      json['displayPort'] as int,
      json['usb_3_0'] as int,
      json['usb_2_0'] as int,
      json['usbTypeC'] as int,
      json['description'] as String,
      json['recommendedPrice'] as int,
      PerformanceLevel.fromJson(
          json['performanceLevel'] as Map<String, dynamic>),
      bluetooth: json['bluetooth'] as bool,
      wifi: json['wifi'] as bool,
      digitalAudioJack: json['digitalAudioJack'] as bool,
    );

Map<String, dynamic> _$MotherboardToJson(Motherboard instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'producer': instance.producer,
      'socket': instance.socket,
      'cpuGeneration': instance.cpuGeneration,
      'chipset': instance.chipset,
      'formFactor': instance.formFactor,
      'maxTdpOfProcessors': instance.maxTdpOfProcessors,
      'memorySlots': instance.memorySlots,
      'supportedMemoryFrequency': instance.supportedMemoryFrequency,
      'maxAmountOfRam': instance.maxAmountOfRam,
      'network': instance.network,
      'bluetooth': instance.bluetooth,
      'wifi': instance.wifi,
      'pciExpressX16': instance.pciExpressX16,
      'pciExpressX4': instance.pciExpressX4,
      'pciExpressX1': instance.pciExpressX1,
      'sata3': instance.sata3,
      'm2': instance.m2,
      'dSub': instance.dSub,
      'dvi': instance.dvi,
      'hdmi': instance.hdmi,
      'displayPort': instance.displayPort,
      'usb_3_0': instance.usb_3_0,
      'usb_2_0': instance.usb_2_0,
      'usbTypeC': instance.usbTypeC,
      'digitalAudioJack': instance.digitalAudioJack,
      'description': instance.description,
      'recommendedPrice': instance.recommendedPrice,
      'performanceLevel': instance.performanceLevel,
    };
