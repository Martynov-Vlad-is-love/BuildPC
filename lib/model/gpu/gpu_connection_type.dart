class GPUConnectionType {
  final int id;
  String connectionType;

  GPUConnectionType(this.id, this.connectionType);

  GPUConnectionType.fromJson(Map<String, dynamic> json)
      : id = json["id"] as int,
        connectionType = json["connectionType"] as String;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      "id": id.toString(),
      "connectionType": connectionType,
    };

    return data;
  }
}
