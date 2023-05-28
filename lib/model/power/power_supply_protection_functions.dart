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
}
