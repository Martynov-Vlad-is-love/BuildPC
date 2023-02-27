class Case {
  final int id;
  int name;
  int size;
  int formFactor;
  int powerSupplyLocation;
  bool fansIncluded;
  int usb_3_2;
  int usb_3_0;
  int usb_2_0;
  int designFeatures;
  int maxLengthOfGraphicsCard;
  int powerSupplyFormFactor;

  Case(
      this.id,
      this.name,
      this.size,
      this.formFactor,
      this.powerSupplyLocation,
      this.usb_3_2,
      this.usb_3_0,
      this.usb_2_0,
      this.designFeatures,
      this.maxLengthOfGraphicsCard,
      this.powerSupplyFormFactor,
      {required this.fansIncluded,});

  Case.fromJson(Map<String, dynamic> json)
      : id = json["id"] as int,
        name = json["name"] as int,
        size = json["size"] as int,
        formFactor = json["formFactor"] as int,
        powerSupplyLocation = json["powerSupplyLocation"] as int,
        fansIncluded = json["fansIncluded"] as bool,
        usb_3_2 = json["usb_3_2"] as int,
        usb_3_0 = json["usb_3_0"] as int,
        usb_2_0 = json["usb_2_0"] as int,
        designFeatures = json["designFeatures"] as int,
        maxLengthOfGraphicsCard = json["maxLengthOfGraphicsCard"] as int,
        powerSupplyFormFactor = json["powerSupplyFormFactor"] as int;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      "id": id.toString(),
      "name": name,
      "size": size.toString(),
      "formFactor": formFactor.toString(),
      "powerSupplyLocation": powerSupplyLocation.toString(),
      "fansIncluded": fansIncluded.toString(),
      "usb_3_2": usb_3_2.toString(),
      "usb_3_0": usb_3_0.toString(),
      "usb_2_0": usb_2_0.toString(),
      "designFeatures": designFeatures.toString(),
      "maxLengthOfGraphicsCard": maxLengthOfGraphicsCard.toString(),
      "powerSupplyFormFactor": powerSupplyFormFactor.toString(),
    };

    return data;
  }
}
