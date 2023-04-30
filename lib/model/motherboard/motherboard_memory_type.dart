class MotherboardMemoryType {
  final int id;
  final int memoryTypeId;

  MotherboardMemoryType(this.id, this.memoryTypeId);

  MotherboardMemoryType.fromJson(Map<String, dynamic> json)
      : id = json["id"] as int,
        memoryTypeId = json["memoryTypeId"] as int;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      "id": id.toString(),
      "memoryTypeId": memoryTypeId,
    };

    return data;
  }
}
