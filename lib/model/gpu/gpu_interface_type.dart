class GPUInterfaceType {
  final int id;
  String interfaceType;

  GPUInterfaceType(this.id, this.interfaceType);

  GPUInterfaceType.fromJson(Map<String, dynamic> json)
      : id = json["id"] as int,
        interfaceType = json["interfaceType"] as String;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      "id": id.toString(),
      "interfaceType": interfaceType,
    };

    return data;
  }
}
