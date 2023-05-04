import 'package:json_annotation/json_annotation.dart';

part 'storage_form_factor.g.dart';

@JsonSerializable()
class StorageFormFactor {
  final int id;
  String name;

  StorageFormFactor(this.id, this.name);

  factory StorageFormFactor.fromJson(Map<String, dynamic> json) =>
      _$StorageFormFactorFromJson(json);

  Map<String, dynamic> toJson() => _$StorageFormFactorToJson(this);
// StorageFormFactor.fromJson(Map<String, dynamic> json)
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
