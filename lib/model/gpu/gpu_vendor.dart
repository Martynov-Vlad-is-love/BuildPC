class GPUVendor {
  final int id;
  String vendor;

  GPUVendor(this.id, this.vendor);

  GPUVendor.fromJson(Map<String, dynamic> json)
      : id = json["id"] as int,
        vendor = json["vendor"] as String;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      "id": id.toString(),
      "vendor": vendor,
    };

    return data;
  }
}
