import 'package:json_annotation/json_annotation.dart';

part 'cpu_generation.g.dart';

@JsonSerializable()
class CPUGeneration {
  final int id;
  String name;

  CPUGeneration(this.id, this.name);

  factory CPUGeneration.fromJson(Map<String, dynamic> json) =>
      _$CPUGenerationFromJson(json);

  Map<String, dynamic> toJson() => _$CPUGenerationToJson(this);
// CPUGeneration.fromJson(Map<String, dynamic> json)
//     : id = json["id"] as int,
//       generation = json["generation"] as String;
//
// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = <String, dynamic>{
//     "id": id.toString(),
//     "generation": generation,
//   };
//
//   return data;
// }
}
