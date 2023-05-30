import 'package:buildpc/model/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ram_timings.g.dart';

@JsonSerializable()
class RamTimings implements Model{
  final int id;
  String timings;

  RamTimings(this.id, this.timings);

  factory RamTimings.fromJson(Map<String, dynamic> json) =>
      _$RamTimingsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RamTimingsToJson(this);

  @override
  List<String> parsedModels() {
    final fields = [id.toString(), timings];

    return fields;
  }
}
