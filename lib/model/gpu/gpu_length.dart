class GPULength {
  final int id;
  String length;

  GPULength(this.id, this.length);

  GPULength.fromJson(Map<String, dynamic> json)
      : id = json["id"] as int,
        length = json["length"] as String;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      "id": id.toString(),
      "length": length,
    };

    return data;
  }
}
