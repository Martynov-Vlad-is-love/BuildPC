class PerformanceLevel {
  final int id;
  List<Object> performanceLevel;

  PerformanceLevel(this.id, this.performanceLevel);

  PerformanceLevel.fromJson(Map<String, dynamic> json)
      : id = json["id"] as int,
        performanceLevel = json["performanceLevel"] as List<String>;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      "id": id.toString(),
      "performanceLevel": performanceLevel,
    };

    return data;
  }
}
