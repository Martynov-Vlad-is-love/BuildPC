import 'package:buildpc/model/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'case_power_supply_location.g.dart';

@JsonSerializable()
class CasePowerSupplyLocation implements Model{
  final int id;
  String powerSupplyLocation;

  CasePowerSupplyLocation(this.id, this.powerSupplyLocation);

  factory CasePowerSupplyLocation.fromJson(Map<String, dynamic> json) =>
      _$CasePowerSupplyLocationFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CasePowerSupplyLocationToJson(this);

  @override
  List<String> parsedModels() {
    final fields = [id.toString(), powerSupplyLocation];

    return fields;
  }

}
