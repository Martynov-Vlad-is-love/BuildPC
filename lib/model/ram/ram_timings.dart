class RAMTimings{
  final int id;
  String timings;

  RAMTimings(this.id, this.timings);

  RAMTimings.fromJson(Map<String, dynamic> json)
      : id = json["id"] as int,
        timings = json["timings"] as String;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      "id": id.toString(),
      "timings": timings,
    };

    return data;
  }
}
