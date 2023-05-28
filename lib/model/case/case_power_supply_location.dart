import 'package:json_annotation/json_annotation.dart';

part 'case_power_supply_location.g.dart';

@JsonSerializable()
class CasePowerSupplyLocation {
  final int id;
  String? powerSupplyLocation;

  CasePowerSupplyLocation(this.id, this.powerSupplyLocation);

  factory CasePowerSupplyLocation.fromJson(Map<String, dynamic> json) =>
      _$CasePowerSupplyLocationFromJson(json);

  Map<String, dynamic> toJson() => _$CasePowerSupplyLocationToJson(this);

}
