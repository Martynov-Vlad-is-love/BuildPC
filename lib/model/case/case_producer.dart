class CaseProducer {
  final int id;
  String producer;
  String size;

  CaseProducer(this.id, this.producer, this.size);

  CaseProducer.fromJson(Map<String, dynamic> json)
      : id = json["id"] as int,
        producer = json["producer"] as String,
        size = json["size"] as String;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      "id": id.toString(),
      "producer": producer,
      "size": size,
    };

    return data;
  }
}
