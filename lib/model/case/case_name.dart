class CaseName {
  final int id;
  String name;

  CaseName(this.id, this.name);

  CaseName.fromJson(Map<String, dynamic> json)
      : id = json["id"] as int,
        name = json["name"] as String;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      "id": id.toString(),
      "name": name,
    };

    return data;
  }
}
