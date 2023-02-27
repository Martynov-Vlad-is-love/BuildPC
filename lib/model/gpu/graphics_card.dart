class GraphicsCard {
  final int id;
  int producer;
  int name;
  int vendor;
  int year;
  int technicalProcess;
  int gpuFrequency;
  int memorySize;
  int memoryType;
  int memoryFrequency;
  int bus;
  int tdp;
  int connector;
  int length;
  int interfaceType;
  int connectionType;
  int directXVersion;
  int otherGPUTechnologies;

  GraphicsCard(
      this.id,
      this.producer,
      this.name,
      this.vendor,
      this.year,
      this.technicalProcess,
      this.gpuFrequency,
      this.memorySize,
      this.memoryType,
      this.memoryFrequency,
      this.bus,
      this.tdp,
      this.connector,
      this.length,
      this.interfaceType,
      this.connectionType,
      this.directXVersion,
      this.otherGPUTechnologies,);

  GraphicsCard.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        producer = json['producer'] as int,
        name = json['name'] as int,
        vendor = json['vendor'] as int,
        year = json['year'] as int,
        technicalProcess = json['technicalProcess'] as int,
        gpuFrequency = json['gpuFrequency'] as int,
        memorySize = json['memorySize'] as int,
        memoryType = json['memoryType'] as int,
        memoryFrequency = json['memoryFrequency'] as int,
        bus = json['bus'] as int,
        tdp = json['tdp'] as int,
        connector = json['connector'] as int,
        length = json['length'] as int,
        interfaceType = json['interfaceType'] as int,
        connectionType = json['connectionType'] as int,
        directXVersion = json['directXVersion'] as int,
        otherGPUTechnologies = json['otherGPUTechnologies'] as int;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      "id": id.toString(),
      "producer": producer.toString(),
      "name": name.toString(),
      "vendor": vendor.toString(),
      "year": year.toString(),
      "technicalProcess": technicalProcess.toString(),
      "gpuFrequency": gpuFrequency.toString(),
      "memorySize": memorySize.toString(),
      "memoryType": memoryType.toString(),
      "memoryFrequency": memoryFrequency.toString(),
      "bus": bus.toString(),
      "tdp": tdp.toString(),
      "connector": connector.toString(),
      "length": length.toString(),
      "interfaceType": interfaceType.toString(),
      "connectionType": connectionType.toString(),
      "directXVersion": directXVersion.toString(),
      "otherGPUTechnologies": otherGPUTechnologies.toString(),
    };

    return data;
  }
}
