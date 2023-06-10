import 'package:buildpc/model/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'power_supply_protection_functions.g.dart';

@JsonSerializable()
class PowerSupplyProtectionFunctions implements Model {
  final int? id;
  String name;

  PowerSupplyProtectionFunctions(
    this.id, {
    required this.name,
  });

  factory PowerSupplyProtectionFunctions.fromJson(Map<String, dynamic> json) =>
      _$PowerSupplyProtectionFunctionsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PowerSupplyProtectionFunctionsToJson(this);

  @override
  List<String> parsedModels() {
    final fields = [id.toString(), name];

    return fields;
  }
}
