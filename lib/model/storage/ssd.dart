class SSD {
  final int id;
  int producer;
  int storageSize;
  int formFactor;
  int interface;
  int readingSpeed;
  int writingSpeed;
  int cellsType;
  int size;

  SSD(
    this.id,
    this.producer,
    this.storageSize,
    this.formFactor,
    this.interface,
    this.readingSpeed,
    this.writingSpeed,
    this.cellsType,
    this.size,
  );

  SSD.fromJson(Map<String, dynamic> json)
      : id = json["id"] as int,
        producer = json["producer"] as int,
        storageSize = json["storageSize"] as int,
        formFactor = json["formFactor"] as int,
        interface = json["interface"] as int,
        readingSpeed = json["readingSpeed"] as int,
        writingSpeed = json["writingSpeed"] as int,
        cellsType = json["cellsType"] as int,
        size = json["size"] as int;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      "id": id.toString(),
      "producer": producer,
      "storageSize": storageSize,
      "formFactor": formFactor,
      "interface": interface,
      "readingSpeed": readingSpeed,
      "writingSpeed": writingSpeed,
      "cellsType": cellsType,
      "size": size,
    };

    return data;
  }
}
