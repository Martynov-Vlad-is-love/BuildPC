import 'package:buildpc/model/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'form_factor.g.dart';

@JsonSerializable()
class FormFactor implements Model {
  final int? id;
  String? name;

  FormFactor({this.id, required this.name});

  factory FormFactor.fromJson(Map<String, dynamic> json) =>
      _$FormFactorFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$FormFactorToJson(this);

  @override
  List<String> parsedModels() {
    final fields = [id.toString(), '$name'];

    return fields;
  }
}
