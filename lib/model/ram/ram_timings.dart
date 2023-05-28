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
}
