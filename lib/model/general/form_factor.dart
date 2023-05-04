import 'package:json_annotation/json_annotation.dart';

part 'form_factor.g.dart';

@JsonSerializable()
class FormFactor {
  final int id;
  String name;

  FormFactor(this.id, this.name);

  factory FormFactor.fromJson(Map<String, dynamic> json) =>
      _$FormFactorFromJson(json);

  Map<String, dynamic> toJson() => _$FormFactorToJson(this);
// FormFactor.fromJson(Map<String, dynamic> json)
//     : id = json["id"] as int,
//       formFactor = json["formFactor"] as String;
//
// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = <String, dynamic>{
//     "id": id.toString(),
//     "formFactor": formFactor,
//   };
//
//   return data;
// }
}
