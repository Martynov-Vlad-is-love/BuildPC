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

// Motherboard.fromJson(Map<String, dynamic> json)
//     : id = json['id'] as int,
//       producer = json['producer'] as int,
//       name = json['name'] as int,
//       socket = json['socket'] as int,
//       chipset = json['chipset'] as int,
//       formFactor = json['formFactor'] as int,
//       maxProcessorTDP = json['maxProcessorTDP'] as int,
//       memorySlots = json['memorySlots'] as int,
//       supportedMemoryFrequency = json['supportedMemoryFrequency'] as int,
//       maxAmountOfRAM = json['maxAmountOfRAM'] as int,
//       network = json['network'] as int,
//       bluetooth = json['bluetooth'] as bool,
//       wifi = json['wifi'] as bool,
//       pciExpressX16 = json['pciExpressX16'] as int,
//       pciExpressX4 = json['pciExpressX4'] as int,
//       pciExpressX1 = json['pciExpressX1'] as int,
//       sata3 = json['sata3'] as int,
//       m2 = json['m2'] as int,
//       u2 = json['u2'] as int,
//       vga = json['vga'] as bool,
//       dvi = json['dvi'] as int,
//       hdmi = json['hdmi'] as int,
//       displayPort = json['displayPort'] as int,
//       usb_3_0 = json['usb_3_0'] as int,
//       usb_2_0 = json['usb_2_0'] as int,
//       usbTypeC = json['usbTypeC'] as int,
//       digitalAudioJack = json['digitalAudioJack'] as bool;
//
// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = <String, dynamic>{
//     "id": id.toString(),
//     "producer": producer.toString(),
//     "name": name.toString(),
//     "socket": socket.toString(),
//     "chipset": chipset.toString(),
//     "formFactor": formFactor.toString(),
//     "maxProcessorTDP": maxProcessorTDP.toString(),
//     "memorySlots": memorySlots.toString(),
//     "supportedMemoryFrequency": supportedMemoryFrequency.toString(),
//     "maxAmountOfRAM": maxAmountOfRAM.toString(),
//     "network": network.toString(),
//     "bluetooth": bluetooth.toString(),
//     "wifi": wifi.toString(),
//     "pciExpressX16": pciExpressX16.toString(),
//     "pciExpressX4": pciExpressX4.toString(),
//     "pciExpressX1": pciExpressX1.toString(),
//     "sata3": sata3.toString(),
//     "m2": m2.toString(),
//     "u2": u2.toString(),
//     "vga": vga.toString(),
//     "dvi": dvi.toString(),
//     "hdmi": hdmi.toString(),
//     "displayPort": displayPort.toString(),
//     "usb_3_0": usb_3_0.toString(),
//     "usb_2_0": usb_2_0.toString(),
//     "usbTypeC": usbTypeC.toString(),
//     "digitalAudioJack": digitalAudioJack.toString(),
//   };
//
//   return data;
// }
}
