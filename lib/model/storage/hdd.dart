class HDD {
  final int id;
  int producer;
  int storageSize;
  int speed;
  int formFactor;
  int interface;
  int bufferSize;
  int readingSpeed;
  int writingSpeed;

  HDD(
    this.id,
    this.producer,
    this.storageSize,
    this.speed,
    this.formFactor,
    this.interface,
    this.bufferSize,
    this.readingSpeed,
    this.writingSpeed,
  );

  HDD.fromJson(Map<String, dynamic> json)
      : id = json["id"] as int,
        producer = json["producer"] as int,
        storageSize = json["storageSize"] as int,
        speed = json["speed"] as int,
        formFactor = json["formFactor"] as int,
        interface = json["interface"] as int,
        bufferSize = json["bufferSize"] as int,
        readingSpeed = json["readingSpeed"] as int,
        writingSpeed = json["writingSpeed"] as int;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      "id": id.toString(),
      "producer": producer,
      "storageSize": storageSize,
      "speed": speed,
      "formFactor": formFactor,
      "interface": interface,
      "bufferSize": bufferSize,
      "readingSpeed": readingSpeed,
      "writingSpeed": writingSpeed,
    };

    return data;
  }
}
