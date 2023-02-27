class CPUPCIeController {
  final int id;
  int versionOfPCIeController;
  int countOfPins;

  CPUPCIeController(this.id, this.versionOfPCIeController, this.countOfPins);

  CPUPCIeController.fromJson(Map<String, dynamic> json)
      : id = json["id"] as int,
        versionOfPCIeController = json["versionOfPCIeController"] as int,
        countOfPins = json["countOfPins"] as int;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      "id": id.toString(),
      "versionOfPCIeController": versionOfPCIeController.toString(),
      "countOfPins": countOfPins.toString(),
    };

    return data;
  }
}
