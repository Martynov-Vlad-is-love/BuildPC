class MotherboardName {
  final int id;
  String name;

  MotherboardName(this.id, this.name);

  MotherboardName.fromJson(Map<String, dynamic> json)
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
