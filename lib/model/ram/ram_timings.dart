import 'package:json_annotation/json_annotation.dart';

part 'ram_timings.g.dart';

@JsonSerializable()
class RamTimings {
  final int id;
  String timings;

  RamTimings(this.id, this.timings);

  factory RamTimings.fromJson(Map<String, dynamic> json) =>
      _$RamTimingsFromJson(json);

  Map<String, dynamic> toJson() => _$RamTimingsToJson(this);
// RamTimings.fromJson(Map<String, dynamic> json)
//     : id = json["id"] as int,
//       timings = json["timings"] as String;
//
// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = <String, dynamic>{
//     "id": id.toString(),
//     "timings": timings,
//   };
//
//   return data;
// }
}
