class MotherboardNetwork{
  final int id;
  String network;

  MotherboardNetwork(this.id, this.network);

  MotherboardNetwork.fromJson(Map<String, dynamic> json)
      : id = json["id"] as int,
        network = json["network"] as String;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      "id": id.toString(),
      "network": network,
    };

    return data;
  }
}
