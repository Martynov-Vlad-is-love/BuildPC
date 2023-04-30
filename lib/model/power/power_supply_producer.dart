class PowerSupplyProducer {
  final int id;
  String producer;

  PowerSupplyProducer(this.id, this.producer);

  PowerSupplyProducer.fromJson(Map<String, dynamic> json)
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
