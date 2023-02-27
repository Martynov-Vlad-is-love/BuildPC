class CaseDesignFeatures {
  final int id;
  String designFeatures;

  CaseDesignFeatures(this.id, this.designFeatures);

  CaseDesignFeatures.fromJson(Map<String, dynamic> json)
      : id = json["id"] as int,
        designFeatures = json["designFeatures"] as String;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      "id": id.toString(),
      "designFeatures": designFeatures,
    };

    return data;
  }
}
