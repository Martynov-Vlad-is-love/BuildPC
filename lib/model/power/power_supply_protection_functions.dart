import 'package:json_annotation/json_annotation.dart';

part 'power_supply_protection_functions.g.dart';

@JsonSerializable()
class PowerSupplyProtectionFunctions {
  final int id;
  String name;

  PowerSupplyProtectionFunctions(
    this.id,
    this.name,
  );

  factory PowerSupplyProtectionFunctions.fromJson(Map<String, dynamic> json) =>
      _$PowerSupplyProtectionFunctionsFromJson(json);

  Map<String, dynamic> toJson() => _$PowerSupplyProtectionFunctionsToJson(this);

// PowerSupplyProtectionFunctions.fromJson(Map<String, dynamic> json)
//     : id = json["id"] as int,
//       overCurrentProtection = json["overCurrentProtection"] as bool,
//       overLoadProtection = json["overLoadProtection"] as bool,
//       overTemperatureProtection = json["overTemperatureProtection"] as bool,
//       overVoltageProtection = json["overVoltageProtection"] as bool,
//       overCircuitProtection = json["overCircuitProtection"] as bool,
//       lowVoltageMainsProtection = json["lowVoltageMainsProtection"] as bool,
//       surgeProtection = json["surgeProtection"] as bool;
//
// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = <String, dynamic>{
//     "id": id.toString(),
//     "overCurrentProtection": overCurrentProtection,
//     "overLoadProtection": overLoadProtection,
//     "overTemperatureProtection": overTemperatureProtection,
//     "overVoltageProtection": overVoltageProtection,
//     "overCircuitProtection": overCircuitProtection,
//     "lowVoltageMainsProtection": lowVoltageMainsProtection,
//     "surgeProtection": surgeProtection,
//   };
//
//   return data;
// }
}
