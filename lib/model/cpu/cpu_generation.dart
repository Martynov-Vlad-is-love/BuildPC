class CPUGeneration {
  final int id;
  String generation;

  CPUGeneration(this.id, this.generation);

  CPUGeneration.fromJson(Map<String, dynamic> json)
      : id = json["id"] as int,
        generation = json["generation"] as String;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      "id": id.toString(),
      "generation": generation,
    };

    return data;
  }
}
