class CasePowerSupplyLocation {
  final int id;
  String? powerSupplyLocation;

  CasePowerSupplyLocation(this.id, this.powerSupplyLocation);

  CasePowerSupplyLocation.fromJson(Map<String, dynamic> json)
      : id = json["id"] as int,
        powerSupplyLocation = json["powerSupplyLocation"] as String;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      "id": id.toString(),
      "powerSupplyLocation": powerSupplyLocation,
    };

    return data;
  }
}
