import 'package:buildpc/model/cpu/cpu_generation.dart';
import 'package:buildpc/model/cpu/cpu_pcie_version.dart';
import 'package:buildpc/model/general/form_factor.dart';
import 'package:buildpc/model/general/performance_level.dart';
import 'package:buildpc/model/general/producers.dart';
import 'package:buildpc/model/model.dart';
import 'package:buildpc/model/motherboard/motherboard_chipset.dart';
import 'package:buildpc/model/motherboard/motherboard_network.dart';
import 'package:buildpc/model/motherboard/motherboard_socket.dart';
import 'package:json_annotation/json_annotation.dart';

part 'motherboard.g.dart';

@JsonSerializable()
class Motherboard implements Model {
  final int? id;
  String name;
  Producers motherboardProducer;
  MotherboardSocket socket;
  List<CPUGeneration> cpuGenerations;
  MotherboardChipset chipset;
  FormFactor formFactor;
  int maxTdpOfProcessors;
  int memorySlots;
  int supportedMemoryFrequency;
  int maxAmountOfRam;
  MotherboardNetwork network;
  bool bluetooth;
  bool wifi;
  CPUPCIeVersion pcieVersion;
  @JsonKey(name: 'pci_express_x16')
  int pciExpressX16;
  @JsonKey(name: 'pci_express_x4')
  int pciExpressX4;
  @JsonKey(name: 'pci_express_x1')
  int pciExpressX1;
  int sata3;
  int m2;
  int dSub;
  int dvi;
  int hdmi;
  int displayPort;
  int usb_3_0;
  int usb_2_0;
  @JsonKey(name: 'usb_type_c')
  int usbTypeC;
  bool digitalAudioJack;
  String description;
  int recommendedPrice;
  PerformanceLevel performanceLevel;

  Motherboard({
    this.id,
    required this.name,
    required this.motherboardProducer,
    required this.socket,
    required this.cpuGenerations,
    required this.chipset,
    required this.formFactor,
    required this.maxTdpOfProcessors,
    required this.memorySlots,
    required this.supportedMemoryFrequency,
    required this.maxAmountOfRam,
    required this.network,
    required this.bluetooth,
    required this.wifi,
    required this.pcieVersion,
    required this.pciExpressX16,
    required this.pciExpressX4,
    required this.pciExpressX1,
    required this.sata3,
    required this.m2,
    required this.dSub,
    required this.dvi,
    required this.hdmi,
    required this.displayPort,
    required this.usb_3_0,
    required this.usb_2_0,
    required this.usbTypeC,
    required this.digitalAudioJack,
    required this.description,
    required this.recommendedPrice,
    required this.performanceLevel,
  });

  factory Motherboard.fromJson(Map<String, dynamic> json) =>
      _$MotherboardFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MotherboardToJson(this);

  @override
  List<String> parsedModels() {
    final cpuGen = [];
    for (final gen in cpuGenerations) {
      cpuGen.add(gen.name);
    }

    final fields = [
      id.toString(),
      name,
      motherboardProducer.name,
      socket.socket,
      cpuGen.toString(),
      chipset.chipset,
      formFactor.toString(),
      maxTdpOfProcessors.toString(),
      memorySlots.toString(),
      supportedMemoryFrequency.toString(),
      maxAmountOfRam.toString(),
      network.toString(),
      bluetooth.toString(),
      wifi.toString(),
      pcieVersion.name,
      pciExpressX16.toString(),
      pciExpressX4.toString(),
      pciExpressX1.toString(),
      sata3.toString(),
      m2.toString(),
      dSub.toString(),
      dvi.toString(),
      hdmi.toString(),
      displayPort.toString(),
      usb_3_0.toString(),
      usb_2_0.toString(),
      usbTypeC.toString(),
      digitalAudioJack.toString(),
      description,
      recommendedPrice.toString(),
      performanceLevel.level,
    ];

    return fields;
  }
}
