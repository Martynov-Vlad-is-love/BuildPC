class CoolerMaterial {
  final int id;
  String material;

  CoolerMaterial(this.id, this.material);

  CoolerMaterial.fromJson(Map<String, dynamic> json)
      : id = json["id"] as int,
        material = json["material"] as String;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      "id": id.toString(),
      "material": material,
    };

    return data;
  }
}
