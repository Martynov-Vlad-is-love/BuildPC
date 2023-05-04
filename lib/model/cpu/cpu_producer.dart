import 'package:json_annotation/json_annotation.dart';

part 'cpu_producer.g.dart';

@JsonSerializable()
class CPUProducer {
  final int id;
  String name;

  CPUProducer(this.id, this.name);

  factory CPUProducer.fromJson(Map<String, dynamic> json) =>
      _$CPUProducerFromJson(json);

  Map<String, dynamic> toJson() => _$CPUProducerToJson(this);
// CPUProducer.fromJson(Map<String, dynamic> json)
//     : id = json["id"] as int,
//       producer = json["producer"] as String;
//
// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = <String, dynamic>{
//     "id": id.toString(),
//     "producer": producer,
//   };
//
//   return data;
// }
}
