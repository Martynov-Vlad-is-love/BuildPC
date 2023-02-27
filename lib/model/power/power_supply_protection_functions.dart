class PowerSupplyProtectionFunctions {
  final int id;
  bool overCurrentProtection;
  bool overLoadProtection;
  bool overTemperatureProtection;
  bool overVoltageProtection;
  bool overCircuitProtection;
  bool lowVoltageMainsProtection;
  bool surgeProtection;

  PowerSupplyProtectionFunctions(
      this.id,
      {required this.overCurrentProtection,
      required this.overLoadProtection,
      required this.overTemperatureProtection,
      required this.overVoltageProtection,
      required this.overCircuitProtection,
      required this.lowVoltageMainsProtection,
      required this.surgeProtection,});

  PowerSupplyProtectionFunctions.fromJson(Map<String, dynamic> json)
      : id = json["id"] as int,
        overCurrentProtection = json["overCurrentProtection"] as bool,
        overLoadProtection = json["overLoadProtection"] as bool,
        overTemperatureProtection = json["overTemperatureProtection"] as bool,
        overVoltageProtection = json["overVoltageProtection"] as bool,
        overCircuitProtection = json["overCircuitProtection"] as bool,
        lowVoltageMainsProtection = json["lowVoltageMainsProtection"] as bool,
        surgeProtection = json["surgeProtection"] as bool;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      "id": id.toString(),
      "overCurrentProtection": overCurrentProtection,
      "overLoadProtection": overLoadProtection,
      "overTemperatureProtection": overTemperatureProtection,
      "overVoltageProtection": overVoltageProtection,
      "overCircuitProtection": overCircuitProtection,
      "lowVoltageMainsProtection": lowVoltageMainsProtection,
      "surgeProtection": surgeProtection,
    };

    return data;
  }
}
