import 'package:buildpc/model/cpu/cpu_generation.dart';
import 'package:buildpc/model/general/performance_level.dart';
import 'package:buildpc/model/general/producers.dart';
import 'package:buildpc/model/motherboard/motherboard_chipset.dart';
import 'package:buildpc/model/motherboard/motherboard_network.dart';
import 'package:buildpc/model/motherboard/motherboard_socket.dart';
import 'package:json_annotation/json_annotation.dart';

part 'motherboard.g.dart';

@JsonSerializable()
class Motherboard {
  final int id;
  String name;
  Producers producer;
  MotherboardSocket socket;
  List<CPUGeneration> cpuGeneration;
  MotherboardChipset chipset;
  int formFactor;
  int maxTdpOfProcessors;
  int memorySlots;
  int supportedMemoryFrequency;
  int maxAmountOfRam;
  MotherboardNetwork network;
  bool bluetooth;
  bool wifi;
  int pciExpressX16;
  int pciExpressX4;
  int pciExpressX1;
  int sata3;
  int m2;
  int dSub;
  int dvi;
  int hdmi;
  int displayPort;
  int usb_3_0;
  int usb_2_0;
  int usbTypeC;
  bool digitalAudioJack;
  String description;
  int recommendedPrice;
  PerformanceLevel performanceLevel;

  Motherboard(
    this.id,
    this.name,
    this.producer,
    this.socket,
    this.cpuGeneration,
    this.chipset,
    this.formFactor,
    this.maxTdpOfProcessors,
    this.memorySlots,
    this.supportedMemoryFrequency,
    this.maxAmountOfRam,
    this.network,
    this.pciExpressX16,
    this.pciExpressX4,
    this.pciExpressX1,
    this.sata3,
    this.m2,
    this.dSub,
    this.dvi,
    this.hdmi,
    this.displayPort,
    this.usb_3_0,
    this.usb_2_0,
    this.usbTypeC,
    this.description,
    this.recommendedPrice,
    this.performanceLevel, {
    required this.bluetooth,
    required this.wifi,
    required this.digitalAudioJack,
  });

  factory Motherboard.fromJson(Map<String, dynamic> json) =>
      _$MotherboardFromJson(json);

  Map<String, dynamic> toJson() => _$MotherboardToJson(this);
}
