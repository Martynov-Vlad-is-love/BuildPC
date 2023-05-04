import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  int id;
  String name;
  String login;
  String email;
  String password;

  User(this.id, this.name, this.login, this.email, this.password);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
// User.fromJson(Map<String, dynamic> json)
//     : id = json["id"] as int,
//       name = json["name"] as String,
//       login = json["login"] as String,
//       eMail = json["eMail"] as String,
//       password = json["password"] as String;
//
// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = <String, dynamic>{
//     "id": id.toString(),
//     "name": name,
//     "login": login,
//     "eMail": eMail,
//     "password": password,
//   };
//
//   return data;
// }
}
