class RAMMemoryType{
  final int id;
  String memoryType;

  RAMMemoryType(this.id, this.memoryType);

  RAMMemoryType.fromJson(Map<String, dynamic> json)
      : id = json["id"] as int,
        memoryType = json["memoryType"] as String;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      "id": id.toString(),
      "memoryType": memoryType,
    };

    return data;
  }
}
