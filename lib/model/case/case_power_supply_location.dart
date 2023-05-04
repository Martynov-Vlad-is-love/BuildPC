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
// CasePowerSupplyLocation.fromJson(Map<String, dynamic> json)
//     : id = json["id"] as int,
//       powerSupplyLocation = json["powerSupplyLocation"] as String;
//
// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = <String, dynamic>{
//     "id": id.toString(),
//     "powerSupplyLocation": powerSupplyLocation,
//   };
//
//   return data;
// }
}
