import 'package:json_annotation/json_annotation.dart';

part 'admin.g.dart';

@JsonSerializable()
class Admin {
  final int id;
  String login;
  String eMail;
  String password;

  Admin(this.id, this.login, this.eMail, this.password);

  factory Admin.fromJson(Map<String, dynamic> json) => _$AdminFromJson(json);

  Map<String, dynamic> toJson() => _$AdminToJson(this);
// Admin.fromJson(Map<String, dynamic> json)
//     : id = json["id"] as int,
//       login = json["login"] as String,
//       eMail = json["eMail"] as String,
//       password = json["password"] as String;
//
// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = <String, dynamic>{
//     "id": id.toString(),
//     "login": login,
//     "eMail": eMail,
//     "password": password,
//   };
//
//   return data;
// }
}
