import 'package:json_annotation/json_annotation.dart';

part 'cooler_producer.g.dart';

@JsonSerializable()
class CoolerProducer {
  final int id;
  String name;

  CoolerProducer(this.id, this.name);

  factory CoolerProducer.fromJson(Map<String, dynamic> json) =>
      _$CoolerProducerFromJson(json);

  Map<String, dynamic> toJson() => _$CoolerProducerToJson(this);
// CoolerProducer.fromJson(Map<String, dynamic> json)
//     : id = json["id"] as int,
//       name = json["name"] as String;
//
// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = <String, dynamic>{
//     "id": id.toString(),
//     "name": name,
//   };
//
//   return data;
// }
}
