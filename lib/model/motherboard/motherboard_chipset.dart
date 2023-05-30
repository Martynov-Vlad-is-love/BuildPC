import 'package:buildpc/model/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'motherboard_chipset.g.dart';

@JsonSerializable()
class MotherboardChipset implements Model {
  final int id;
  String chipset;

  MotherboardChipset(this.id, this.chipset);

  factory MotherboardChipset.fromJson(Map<String, dynamic> json) =>
      _$MotherboardChipsetFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MotherboardChipsetToJson(this);

  @override
  List<String> parsedModels() {
    final fields = [id.toString(), chipset];

    return fields;
  }
}
