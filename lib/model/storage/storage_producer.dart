import 'package:json_annotation/json_annotation.dart';

part 'storage_producer.g.dart';

@JsonSerializable()
class StorageProducer {
  final int id;
  String name;

  StorageProducer(this.id, this.name);

  factory StorageProducer.fromJson(Map<String, dynamic> json) =>
      _$StorageProducerFromJson(json);

  Map<String, dynamic> toJson() => _$StorageProducerToJson(this);
// StorageProducer.fromJson(Map<String, dynamic> json)
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
