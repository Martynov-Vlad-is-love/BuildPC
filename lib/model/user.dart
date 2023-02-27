class User{
  int id;
  String name;
  String login;
  String eMail;
  String password;

  User(this.id, this.name, this.login, this.eMail, this.password);

  User.fromJson(Map<String, dynamic> json)
      : id = json["id"] as int,
        name = json["name"] as String,
        login = json["login"] as String,
        eMail = json["eMail"] as String,
        password = json["password"] as String;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      "id": id.toString(),
      "name": name,
      "login": login,
      "eMail": eMail,
      "password": password,
    };

    return data;
  }
}
