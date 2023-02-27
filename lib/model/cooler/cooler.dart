class Cooler {
  final int id;
  int name;
  int connector;
  int material;
  int maxTDP;
  int supportedSockets;
  int thermotubes;

  Cooler(
      this.id,
      this.name,
      this.connector,
      this.material,
      this.maxTDP,
      this.supportedSockets,
      this.thermotubes,);

  Cooler.fromJson(Map<String, dynamic> json)
      : id = json["id"] as int,
        name = json["name"] as int,
        connector = json["connector"] as int,
        material = json["material"] as int,
        maxTDP = json["maxTDP"] as int,
        supportedSockets = json["supportedSockets"] as int,
        thermotubes = json["thermotubes"] as int;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      "id": id.toString(),
      "name": name,
      "connector": connector.toString(),
      "material": material.toString(),
      "maxTDP": maxTDP.toString(),
      "supportedSockets": supportedSockets.toString(),
      "thermotubes": thermotubes.toString(),
    };

    return data;
  }
}
