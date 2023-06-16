// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'motherboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Motherboard _$MotherboardFromJson(Map<String, dynamic> json) => Motherboard(
      id: json['id'] as int?,
      name: json['name'] as String?,
      motherboardProducer: json['motherboardProducer'] == null
          ? null
          : Producers.fromJson(
              json['motherboardProducer'] as Map<String, dynamic>),
      socket: json['socket'] == null
          ? null
          : MotherboardSocket.fromJson(json['socket'] as Map<String, dynamic>),
      cpuGenerations: (json['cpuGenerations'] as List<dynamic>)
          .map((e) => e == null
              ? null
              : CPUGeneration.fromJson(e as Map<String, dynamic>))
          .toList(),
      chipset: json['chipset'] == null
          ? null
          : MotherboardChipset.fromJson(
              json['chipset'] as Map<String, dynamic>),
      formFactor: json['formFactor'] == null
          ? null
          : FormFactor.fromJson(json['formFactor'] as Map<String, dynamic>),
      maxTdpOfProcessors: json['maxTdpOfProcessors'] as int?,
      memorySlots: json['memorySlots'] as int?,
      supportedMemoryFrequency: json['supportedMemoryFrequency'] as int?,
      maxAmountOfRam: json['maxAmountOfRam'] as int?,
      ramMemoryType: json['ramMemoryType'] == null
          ? null
          : RamMemoryType.fromJson(
              json['ramMemoryType'] as Map<String, dynamic>),
      network: json['network'] == null
          ? null
          : MotherboardNetwork.fromJson(
              json['network'] as Map<String, dynamic>),
      bluetooth: json['bluetooth'] as bool?,
      wifi: json['wifi'] as bool?,
      pcieVersion: json['pcieVersion'] == null
          ? null
          : CPUPCIeVersion.fromJson(
              json['pcieVersion'] as Map<String, dynamic>),
      pciExpressX16: json['pci_express_x16'] as int?,
      pciExpressX4: json['pci_express_x4'] as int?,
      pciExpressX1: json['pci_express_x1'] as int?,
      sata3: json['sata3'] as int?,
      m2: json['m2'] as int?,
      dsub: json['dsub'] as bool?,
      dvi: json['dvi'] as int?,
      hdmi: json['hdmi'] as int?,
      displayPort: json['displayPort'] as int?,
      usb_3_0: json['usb_3_0'] as int?,
      usb_2_0: json['usb_2_0'] as int?,
      usbTypeC: json['usb_type_c'] as int?,
      digitalAudioJack: json['digitalAudioJack'] as bool?,
      description: json['description'] as String?,
      recommendedPrice: json['recommendedPrice'] as int?,
      performanceLevel: json['performanceLevel'] == null
          ? null
          : PerformanceLevel.fromJson(
              json['performanceLevel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MotherboardToJson(Motherboard instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'motherboardProducer': instance.motherboardProducer,
      'socket': instance.socket,
      'cpuGenerations': instance.cpuGenerations,
      'chipset': instance.chipset,
      'formFactor': instance.formFactor,
      'maxTdpOfProcessors': instance.maxTdpOfProcessors,
      'memorySlots': instance.memorySlots,
      'supportedMemoryFrequency': instance.supportedMemoryFrequency,
      'maxAmountOfRam': instance.maxAmountOfRam,
      'ramMemoryType': instance.ramMemoryType,
      'network': instance.network,
      'bluetooth': instance.bluetooth,
      'wifi': instance.wifi,
      'pcieVersion': instance.pcieVersion,
      'pci_express_x16': instance.pciExpressX16,
      'pci_express_x4': instance.pciExpressX4,
      'pci_express_x1': instance.pciExpressX1,
      'sata3': instance.sata3,
      'm2': instance.m2,
      'dsub': instance.dsub,
      'dvi': instance.dvi,
      'hdmi': instance.hdmi,
      'displayPort': instance.displayPort,
      'usb_3_0': instance.usb_3_0,
      'usb_2_0': instance.usb_2_0,
      'usb_type_c': instance.usbTypeC,
      'digitalAudioJack': instance.digitalAudioJack,
      'description': instance.description,
      'recommendedPrice': instance.recommendedPrice,
      'performanceLevel': instance.performanceLevel,
    };
