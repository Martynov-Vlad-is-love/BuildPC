class GPUConnector {
  final int id;
  String connector;

  GPUConnector(this.id, this.connector);

  GPUConnector.fromJson(Map<String, dynamic> json)
      : id = json["id"] as int,
        connector = json["connector"] as String;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      "id": id.toString(),
      "connector": connector,
    };

    return data;
  }
}
