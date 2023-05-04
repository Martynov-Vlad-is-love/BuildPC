import 'package:json_annotation/json_annotation.dart';

part 'ram_producer.g.dart';

@JsonSerializable()
class RamProducer {
  final int id;
  String producer;

  RamProducer(this.id, this.producer);

  factory RamProducer.fromJson(Map<String, dynamic> json) =>
      _$RamProducerFromJson(json);

  Map<String, dynamic> toJson() => _$RamProducerToJson(this);
// RAMProducer.fromJson(Map<String, dynamic> json)
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
