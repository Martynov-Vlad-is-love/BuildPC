class MotherboardProducers {
  final int id;
  String producer;

  MotherboardProducers(this.id, this.producer);

  MotherboardProducers.fromJson(Map<String, dynamic> json)
      : id = json["id"] as int,
        producer = json["producer"] as String;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      "id": id.toString(),
      "producer": producer,
    };

    return data;
  }
}
