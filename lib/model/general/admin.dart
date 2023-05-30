import 'package:buildpc/model/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin.g.dart';

@JsonSerializable()
class Admin implements Model{
  final int id;
  String login;
  String eMail;
  String password;

  Admin(this.id, this.login, this.eMail, this.password);

  factory Admin.fromJson(Map<String, dynamic> json) => _$AdminFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AdminToJson(this);

  @override
  List<String> parsedModels() {
    final fields = [
      id.toString(),
      login,
      eMail,
      password
    ];

    return fields;
  }

}
