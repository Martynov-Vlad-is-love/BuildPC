import 'package:buildpc/model/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'storage_form_factor.g.dart';

@JsonSerializable()
class StorageFormFactor implements Model{
  final int? id;
  String name;

  StorageFormFactor(this.id, this.name);

  factory StorageFormFactor.fromJson(Map<String, dynamic> json) =>
      _$StorageFormFactorFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StorageFormFactorToJson(this);

  @override
  List<String> parsedModels() {
    final fields = [id.toString(), name];

    return fields;
  }
}
