import 'package:json_annotation/json_annotation.dart';

part 'motherboard_producer.g.dart';

@JsonSerializable()
class MotherboardProducer {
  final int id;
  String producer;

  MotherboardProducer(this.id, this.producer);

  factory MotherboardProducer.fromJson(Map<String, dynamic> json) =>
      _$MotherboardProducerFromJson(json);

  Map<String, dynamic> toJson() => _$MotherboardProducerToJson(this);
// MotherboardProducer.fromJson(Map<String, dynamic> json)
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
