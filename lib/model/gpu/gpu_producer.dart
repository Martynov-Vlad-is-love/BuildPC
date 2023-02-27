class GPUProducer {
  final int id;
  String producer;

  GPUProducer(this.id, this.producer);

  GPUProducer.fromJson(Map<String, dynamic> json)
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
