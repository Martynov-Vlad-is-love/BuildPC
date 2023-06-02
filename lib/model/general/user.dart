import 'package:buildpc/model/general/e_role.dart';
import 'package:buildpc/model/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User implements Model {
  int? id;
  String name;
  String username;
  String email;
  String? password;
  List<ERole>? roles;

  User(
    this.id,
    this.name,
    this.username,
    this.email,
    this.password,
    this.roles,
  );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<String> parsedModels() {
    String pass = '';
    if (password != null) {
      pass = '$password';
    }
    final fields = [
      id.toString(),
      name,
      username,
      email,
      pass,
      roles.toString(),
    ];

    return fields;
  }
}
