class MotherboardChipset{
  final int id;
  String chipset;

  MotherboardChipset(this.id, this.chipset);

  MotherboardChipset.fromJson(Map<String, dynamic> json)
      : id = json["id"] as int,
        chipset = json["chipset"] as String;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      "id": id.toString(),
      "chipset": chipset,
    };

    return data;
  }
}
