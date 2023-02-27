class PowerSupplyPerformanceLevelClass{
  final int id;
  String performanceLevel;

  PowerSupplyPerformanceLevelClass(this.id, this.performanceLevel);

  PowerSupplyPerformanceLevelClass.fromJson(Map<String, dynamic> json)
      : id = json["id"] as int,
        performanceLevel = json["performanceLevel"] as String;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      "id": id.toString(),
      "performanceLevel": performanceLevel,
    };

    return data;
  }
}
