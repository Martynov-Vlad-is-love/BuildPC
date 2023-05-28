import 'package:json_annotation/json_annotation.dart';

part 'motherboard_chipset.g.dart';

@JsonSerializable()
class MotherboardChipset {
  final int id;
  String chipset;

  MotherboardChipset(this.id, this.chipset);

  factory MotherboardChipset.fromJson(Map<String, dynamic> json) =>
      _$MotherboardChipsetFromJson(json);

  Map<String, dynamic> toJson() => _$MotherboardChipsetToJson(this);
}
