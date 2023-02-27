class PowerSupply {
  final int id;
  int name;
  int producer;
  int power;
  int formFactor;
  int performanceLevelClass;
  int pfcModule;
  int modularConnection;
  int protectionFunctions;
  int cpu4pin;
  int cpu4_4pin;
  int cpu8pin;
  int pciE6_2pin;
  int pciE8pin;
  int pciEv5_16pin;
  int sata;
  int countOf12VLines;

  PowerSupply(
      this.id,
      this.name,
      this.producer,
      this.power,
      this.formFactor,
      this.performanceLevelClass,
      this.pfcModule,
      this.modularConnection,
      this.protectionFunctions,
      this.cpu4pin,
      this.cpu4_4pin,
      this.cpu8pin,
      this.pciE6_2pin,
      this.pciE8pin,
      this.pciEv5_16pin,
      this.sata,
      this.countOf12VLines,);

  PowerSupply.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        name = json['name'] as int,
        producer = json['producer'] as int,
        power = json['power'] as int,
        formFactor = json['formFactor'] as int,
        performanceLevelClass = json['performanceLevelClass'] as int,
        pfcModule = json['pfcModule'] as int,
        modularConnection = json['modularConnection'] as int,
        protectionFunctions = json['protectionFunctions'] as int,
        cpu4pin = json['cpu4pin'] as int,
        cpu4_4pin = json['cpu4_4pin'] as int,
        cpu8pin = json['cpu8pin'] as int,
        pciE6_2pin = json['pciE6_2pin'] as int,
        pciE8pin = json['pciE8pin'] as int,
        pciEv5_16pin = json['pciEv5_16pin'] as int,
        sata = json['sata'] as int,
        countOf12VLines = json['countOf12VLines'] as int;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      "id": id.toString(),
      "name": name.toString(),
      "producer": producer.toString(),
      "power": power.toString(),
      "formFactor": formFactor.toString(),
      "performanceLevelClass": performanceLevelClass.toString(),
      "pfcModule": pfcModule.toString(),
      "modularConnection": modularConnection.toString(),
      "protectionFunctions": protectionFunctions.toString(),
      "cpu4pin": cpu4pin.toString(),
      "cpu4_4pin": cpu4_4pin.toString(),
      "cpu8pin": cpu8pin.toString(),
      "pciE6_2pin": pciE6_2pin.toString(),
      "pciE8pin": pciE8pin.toString(),
      "pciEv5_16pin": pciEv5_16pin.toString(),
      "sata": sata.toString(),
      "countOf12VLines": countOf12VLines.toString(),
    };

    return data;
  }
}
