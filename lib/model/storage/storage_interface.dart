import 'package:buildpc/model/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'storage_interface.g.dart';

@JsonSerializable()
class StorageInterface implements Model{
  final int? id;
  String? name;

  StorageInterface(this.id, {required this.name});

  factory StorageInterface.fromJson(Map<String, dynamic> json) =>
      _$StorageInterfaceFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StorageInterfaceToJson(this);

  @override
  List<String> parsedModels() {
    final fields = [id.toString(), name.toString()];

    return fields;
  }
}
