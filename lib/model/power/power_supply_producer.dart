import 'package:json_annotation/json_annotation.dart';

part 'power_supply_producer.g.dart';

@JsonSerializable()
class PowerSupplyProducer {
  final int id;
  String producer;

  PowerSupplyProducer(this.id, this.producer);

  factory PowerSupplyProducer.fromJson(Map<String, dynamic> json) =>
      _$PowerSupplyProducerFromJson(json);

  Map<String, dynamic> toJson() => _$PowerSupplyProducerToJson(this);

// PowerSupplyProducer.fromJson(Map<String, dynamic> json)
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
