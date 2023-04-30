class RAM {
  final int id;
  int name;
  int producer;
  int memoryType;
  int memoryCapacity;
  int frequency;
  int timings;
  double powerSupplyVoltage;

  RAM(
    this.id,
    this.name,
    this.producer,
    this.memoryType,
    this.memoryCapacity,
    this.frequency,
    this.timings,
    this.powerSupplyVoltage,
  );

  RAM.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        name = json['name'] as int,
        producer = json['producer'] as int,
        memoryType = json['memoryType'] as int,
        memoryCapacity = json['memoryCapacity'] as int,
        frequency = json['frequency'] as int,
        timings = json['timings'] as int,
        powerSupplyVoltage = json['powerSupplyVoltage'] as double;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      "id": id.toString(),
      "name": name.toString(),
      "producer": producer.toString(),
      "memoryType": memoryType.toString(),
      "memoryCapacity": memoryCapacity.toString(),
      "frequency": frequency.toString(),
      "timings": timings.toString(),
      "powerSupplyVoltage": powerSupplyVoltage.toString()
    };

    return data;
  }
}
