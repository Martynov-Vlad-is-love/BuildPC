class GPUMemoryType {
  final int id;
  String type;

  GPUMemoryType(this.id, this.type);

  GPUMemoryType.fromJson(Map<String, dynamic> json)
      : id = json["id"] as int,
        type = json["type"] as String;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      "id": id.toString(),
      "type": type,
    };

    return data;
  }
}
