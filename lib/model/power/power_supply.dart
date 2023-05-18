import 'package:buildpc/model/general/form_factor.dart';
import 'package:buildpc/model/general/performance_level.dart';
import 'package:buildpc/model/general/producers.dart';
import 'package:buildpc/model/power/power_supply_protection_functions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'power_supply.g.dart';

@JsonSerializable()
class PowerSupply {
  final int id;
  String name;
  Producers producer;
  int power;
  FormFactor formFactor;
  PerformanceLevel performanceLevel;
  bool pfcModule;
  bool modularConnection;
  List<PowerSupplyProtectionFunctions> protectionFunctions;
  int cpu_4pin;
  int cpu_4plus4pin;
  int cpu_8pin;
  int pcie_6plus2pin;
  int pcie_8pin;
  int pcie_5_16pin;
  int sata;

  // ignore: non_constant_identifier_names
  int count_of_12_v_lines;
  String description;
  int recommendedPrice;

  PowerSupply(
    this.id,
    this.name,
    this.producer,
    this.power,
    this.formFactor,
    this.performanceLevel,
    this.protectionFunctions,
    this.cpu_4pin,
    this.cpu_4plus4pin,
    this.cpu_8pin,
    this.pcie_6plus2pin,
    this.pcie_8pin,
    this.pcie_5_16pin,
    this.sata,
    this.count_of_12_v_lines,
    this.description,
    this.recommendedPrice, {
    required this.pfcModule,
    required this.modularConnection,
  });

  factory PowerSupply.fromJson(Map<String, dynamic> json) =>
      _$PowerSupplyFromJson(json);

  Map<String, dynamic> toJson() => _$PowerSupplyToJson(this);

// PowerSupply.fromJson(Map<String, dynamic> json)
//     : id = json['id'] as int,
//       name = json['name'] as int,
//       producer = json['producer'] as int,
//       power = json['power'] as int,
//       formFactor = json['formFactor'] as int,
//       performanceLevelClass = json['performanceLevelClass'] as int,
//       pfcModule = json['pfcModule'] as int,
//       modularConnection = json['modularConnection'] as int,
//       protectionFunctions = json['protectionFunctions'] as int,
//       cpu4pin = json['cpu4pin'] as int,
//       cpu4_4pin = json['cpu4_4pin'] as int,
//       cpu8pin = json['cpu8pin'] as int,
//       pciE6_2pin = json['pciE6_2pin'] as int,
//       pciE8pin = json['pciE8pin'] as int,
//       pciEv5_16pin = json['pciEv5_16pin'] as int,
//       sata = json['sata'] as int,
//       countOf12VLines = json['countOf12VLines'] as int;
//
// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = <String, dynamic>{
//     "id": id.toString(),
//     "name": name.toString(),
//     "producer": producer.toString(),
//     "power": power.toString(),
//     "formFactor": formFactor.toString(),
//     "performanceLevelClass": performanceLevelClass.toString(),
//     "pfcModule": pfcModule.toString(),
//     "modularConnection": modularConnection.toString(),
//     "protectionFunctions": protectionFunctions.toString(),
//     "cpu4pin": cpu4pin.toString(),
//     "cpu4_4pin": cpu4_4pin.toString(),
//     "cpu8pin": cpu8pin.toString(),
//     "pciE6_2pin": pciE6_2pin.toString(),
//     "pciE8pin": pciE8pin.toString(),
//     "pciEv5_16pin": pciEv5_16pin.toString(),
//     "sata": sata.toString(),
//     "countOf12VLines": countOf12VLines.toString(),
//   };
//
//   return data;
// }
}
