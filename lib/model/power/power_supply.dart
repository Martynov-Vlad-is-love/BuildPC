import 'package:buildpc/model/general/form_factor.dart';
import 'package:buildpc/model/general/performance_level.dart';
import 'package:buildpc/model/general/producers.dart';
import 'package:buildpc/model/model.dart';
import 'package:buildpc/model/power/power_supply_protection_functions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'power_supply.g.dart';

@JsonSerializable()
class PowerSupply implements Model{
  final int id;
  String name;
  Producers producer;
  int power;
  FormFactor formFactor;
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
  @JsonKey(name: 'count_of_12_v_lines')
  int countOf_12VLines;
  String description;
  int recommendedPrice;
  PerformanceLevel performanceLevel;

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
    this.countOf_12VLines,
    this.description,
    this.recommendedPrice, {
    required this.pfcModule,
    required this.modularConnection,
  });

  factory PowerSupply.fromJson(Map<String, dynamic> json) =>
      _$PowerSupplyFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PowerSupplyToJson(this);

  @override
  List<String> parsedModels() {
    final powerSupplyPF = [];
    for(final protectionFunction in protectionFunctions){
      powerSupplyPF.add(protectionFunction.name);
    }

    final List<String> fields = [
      id.toString(),
      name,
      producer.name,
      power.toString(),
      formFactor.name,
      pfcModule.toString(),
      modularConnection.toString(),
      powerSupplyPF.toString(),
      cpu_4pin.toString(),
      cpu_4plus4pin.toString(),
      cpu_8pin.toString(),
      pcie_6plus2pin.toString(),
      pcie_5_16pin.toString(),
      sata.toString(),
      countOf_12VLines.toString(),
      description,
      recommendedPrice.toString(),
      performanceLevel.level
    ];

    return fields;
  }
}
