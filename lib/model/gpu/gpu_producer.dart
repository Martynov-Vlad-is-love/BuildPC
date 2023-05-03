import 'package:json_annotation/json_annotation.dart';

part 'gpu_producer.g.dart';

@JsonSerializable()
class GPUProducer {
  final int id;
  String producer;

  GPUProducer(this.id, this.producer);

  factory GPUProducer.fromJson(Map<String, dynamic> json) =>
      _$GPUProducerFromJson(json);

  Map<String, dynamic> toJson() => _$GPUProducerToJson(this);
// GPUProducer.fromJson(Map<String, dynamic> json)
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
