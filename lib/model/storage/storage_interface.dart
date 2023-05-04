import 'package:json_annotation/json_annotation.dart';

part 'storage_interface.g.dart';

@JsonSerializable()
class StorageInterface {
  final int id;
  String name;

  StorageInterface(this.id, this.name);

  factory StorageInterface.fromJson(Map<String, dynamic> json) =>
      _$StorageInterfaceFromJson(json);

  Map<String, dynamic> toJson() => _$StorageInterfaceToJson(this);
// StorageInterface.fromJson(Map<String, dynamic> json)
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
