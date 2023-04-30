import 'package:buildpc/model/case/case_design_features.dart';
import 'package:buildpc/model/case/case_power_supply_location.dart';
import 'package:buildpc/model/case/case_producer.dart';
import 'package:buildpc/model/case/case_size.dart';
import 'package:buildpc/model/general/form_factor.dart';
import 'package:buildpc/model/general/performance_level.dart';

class Case {
  final int id;
  int name;
  CaseSize size;
  List<FormFactor> formFactor;
  CaseProducer producer;
  CasePowerSupplyLocation powerSupplyLocation;
  bool fansIncluded;
  int usb_3_2;
  int usb_3_0;
  int usb_2_0;
  List<CaseDesignFeatures> designFeatures;
  int maxLengthOfGraphicCard;
  int powerSupplyFormFactor;
  String description;
  int recommendedPrice;
  PerformanceLevel performanceLevel;

  Case(
    this.id,
    this.name,
    this.size,
    this.formFactor,
    this.producer,
    this.powerSupplyLocation,
    this.usb_3_2,
    this.usb_3_0,
    this.usb_2_0,
    this.designFeatures,
    this.maxLengthOfGraphicCard,
    this.powerSupplyFormFactor,
    this.description,
    this.recommendedPrice,
    this.performanceLevel, {
    required this.fansIncluded,
  });

  Case.fromJson(Map<String, dynamic> json)
      : id = json["id"] as int,
        name = json["name"] as int,
        size = json["size"] as CaseSize,
        formFactor = json["formFactor"] as List<FormFactor>,
        powerSupplyLocation =
            json["powerSupplyLocation"] as CasePowerSupplyLocation,
        fansIncluded = json["fansIncluded"] as bool,
        usb_3_2 = json["usb_3_2"] as int,
        usb_3_0 = json["usb_3_0"] as int,
        usb_2_0 = json["usb_2_0"] as int,
        designFeatures = json["designFeatures"] as List<CaseDesignFeatures>,
        maxLengthOfGraphicCard = json["maxLengthOfGraphicCard"] as int,
        powerSupplyFormFactor = json["powerSupplyFormFactor"] as int,
        description = json["description"] as String,
        performanceLevel = json["performanceLevel"] as PerformanceLevel,
        producer =
            CaseProducer.fromJson(json["producer"] as Map<String, dynamic>),
        recommendedPrice = json["recommendedPrice"] as int;

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
      "maxLengthOfGraphicCard": maxLengthOfGraphicCard.toString(),
      "powerSupplyFormFactor": powerSupplyFormFactor.toString(),
    };

    return data;
  }
}
