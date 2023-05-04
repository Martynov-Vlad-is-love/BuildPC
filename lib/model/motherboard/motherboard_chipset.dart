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

// MotherboardChipset.fromJson(Map<String, dynamic> json)
//     : id = json["id"] as int,
//       chipset = json["chipset"] as String;
//
// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = <String, dynamic>{
//     "id": id.toString(),
//     "chipset": chipset,
//   };
//
//   return data;
// }
}
