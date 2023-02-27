class PowerSupplyModularConnection{
  final int id;
  String modularConnection;

  PowerSupplyModularConnection(this.id, this.modularConnection);

  PowerSupplyModularConnection.fromJson(Map<String, dynamic> json)
      : id = json["id"] as int,
        modularConnection = json["modularConnection"] as String;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      "id": id.toString(),
      "modularConnection": modularConnection,
    };

    return data;
  }
}
