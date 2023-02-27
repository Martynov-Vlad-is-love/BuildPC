class CaseProducer {
  final int id;
  String producer;

  CaseProducer(this.id, this.producer);

  CaseProducer.fromJson(Map<String, dynamic> json)
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
