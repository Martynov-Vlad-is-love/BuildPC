class CoolerProducer {
  final int id;
  String name;

  CoolerProducer(this.id, this.name);

  CoolerProducer.fromJson(Map<String, dynamic> json)
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
