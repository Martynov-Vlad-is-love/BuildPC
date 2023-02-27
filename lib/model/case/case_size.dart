class CaseSize {
  final int id;
  String size;

  CaseSize(this.id, this.size);

  CaseSize.fromJson(Map<String, dynamic> json)
      : id = json["id"] as int,
        size = json["size"] as String;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      "id": id.toString(),
      "size": size,
    };

    return data;
  }
}
