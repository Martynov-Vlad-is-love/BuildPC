class Motherboard {
  final int id;
  int name;
  int producer;
  int socket;
  int chipset;
  int formFactor;
  int maxProcessorTDP;
  int memorySlots;
  int supportedMemoryFrequency;
  int maxAmountOfRAM;
  int network;
  bool bluetooth;
  bool wifi;
  int pciExpressX16;
  int pciExpressX4;
  int pciExpressX1;
  int sata3;
  int m2;
  int u2;
  bool vga;
  int dvi;
  int hdmi;
  int displayPort;
  int usb_3_0;
  int usb_2_0;
  int usbTypeC;
  bool digitalAudioJack;

  Motherboard(
      this.id,
      this.name,
      this.producer,
      this.socket,
      this.chipset,
      this.formFactor,
      this.maxProcessorTDP,
      this.memorySlots,
      this.supportedMemoryFrequency,
      this.maxAmountOfRAM,
      this.network,
      this.pciExpressX16,
      this.pciExpressX4,
      this.pciExpressX1,
      this.sata3,
      this.m2,
      this.u2,
      this.dvi,
      this.hdmi,
      this.displayPort,
      this.usb_3_0,
      this.usb_2_0,
      this.usbTypeC,
      {required this.bluetooth,
        required this.wifi,
        required this.vga,
        required this.digitalAudioJack,});

  Motherboard.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        producer = json['producer'] as int,
        name = json['name'] as int,
        socket = json['socket'] as int,
        chipset = json['chipset'] as int,
        formFactor = json['formFactor'] as int,
        maxProcessorTDP = json['maxProcessorTDP'] as int,
        memorySlots = json['memorySlots'] as int,
        supportedMemoryFrequency = json['supportedMemoryFrequency'] as int,
        maxAmountOfRAM = json['maxAmountOfRAM'] as int,
        network = json['network'] as int,
        bluetooth = json['bluetooth'] as bool,
        wifi = json['wifi'] as bool,
        pciExpressX16 = json['pciExpressX16'] as int,
        pciExpressX4 = json['pciExpressX4'] as int,
        pciExpressX1 = json['pciExpressX1'] as int,
        sata3 = json['sata3'] as int,
        m2 = json['m2'] as int,
        u2 = json['u2'] as int,
        vga = json['vga'] as bool,
        dvi = json['dvi'] as int,
        hdmi = json['hdmi'] as int,
        displayPort = json['displayPort'] as int,
        usb_3_0 = json['usb_3_0'] as int,
        usb_2_0 = json['usb_2_0'] as int,
        usbTypeC = json['usbTypeC'] as int,
        digitalAudioJack = json['digitalAudioJack'] as bool;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      "id": id.toString(),
      "producer": producer.toString(),
      "name": name.toString(),
      "socket": socket.toString(),
      "chipset": chipset.toString(),
      "formFactor": formFactor.toString(),
      "maxProcessorTDP": maxProcessorTDP.toString(),
      "memorySlots": memorySlots.toString(),
      "supportedMemoryFrequency": supportedMemoryFrequency.toString(),
      "maxAmountOfRAM": maxAmountOfRAM.toString(),
      "network": network.toString(),
      "bluetooth": bluetooth.toString(),
      "wifi": wifi.toString(),
      "pciExpressX16": pciExpressX16.toString(),
      "pciExpressX4": pciExpressX4.toString(),
      "pciExpressX1": pciExpressX1.toString(),
      "sata3": sata3.toString(),
      "m2": m2.toString(),
      "u2": u2.toString(),
      "vga": vga.toString(),
      "dvi": dvi.toString(),
      "hdmi": hdmi.toString(),
      "displayPort": displayPort.toString(),
      "usb_3_0": usb_3_0.toString(),
      "usb_2_0": usb_2_0.toString(),
      "usbTypeC": usbTypeC.toString(),
      "digitalAudioJack": digitalAudioJack.toString(),
    };

    return data;
  }
}
