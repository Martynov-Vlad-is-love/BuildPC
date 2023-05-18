import 'package:buildpc/model/case/case_design_features.dart';
import 'package:buildpc/model/case/case_power_supply_location.dart';
import 'package:buildpc/model/case/case_size.dart';
import 'package:buildpc/model/general/form_factor.dart';
import 'package:buildpc/model/general/performance_level.dart';
import 'package:buildpc/model/general/producers.dart';
import 'package:json_annotation/json_annotation.dart';

part 'case.g.dart';

@JsonSerializable()
class Case {
  final int id;
  int name;
  Producers producer;
  CaseSize size;
  List<FormFactor> formFactor;
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

  factory Case.fromJson(Map<String, dynamic> json) => _$CaseFromJson(json);

  Map<String, dynamic> toJson() => _$CaseToJson(this);

// Case.fromJson(Map<String, dynamic> json)
//     : id = json["id"] as int,
//       name = json["name"] as int,
//       size = CaseSize.fromJson(json["size"] as Map<String, dynamic>),
//       formFactor =
//           json["formFactor"] as List<FormFactor>,
//           //List<Map<String, dynamic>>).map((x => FormFactor.fromJson(x))
//       powerSupplyLocation = CasePowerSupplyLocation.fromJson(
//         json["powerSupplyLocation"] as Map<String, dynamic>,
//       ),
//       fansIncluded = json["fansIncluded"] as bool,
//       usb_3_2 = json["usb_3_2"] as int,
//       usb_3_0 = json["usb_3_0"] as int,
//       usb_2_0 = json["usb_2_0"] as int,
//       designFeatures = CaseDesignFeatures.fromJson(
//         json["designFeatures"] as Map<String, dynamic>,
//       ) as List<CaseDesignFeatures>,
//       maxLengthOfGraphicCard = json["maxLengthOfGraphicCard"] as int,
//       powerSupplyFormFactor = json["powerSupplyFormFactor"] as int,
//       description = json["description"] as String,
//       performanceLevel = PerformanceLevel.fromJson(
//           json["performanceLevel"] as Map<String, dynamic>,),
//       producer =
//           CaseProducer.fromJson(json["producer"] as Map<String, dynamic>),
//       recommendedPrice = json["recommendedPrice"] as int;
//
// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = <String, dynamic>{
//     "id": id.toString(),
//     "name": name,
//     "size": size.toString(),
//     "formFactor": formFactor.toString(),
//     "powerSupplyLocation": powerSupplyLocation.toString(),
//     "fansIncluded": fansIncluded.toString(),
//     "usb_3_2": usb_3_2.toString(),
//     "usb_3_0": usb_3_0.toString(),
//     "usb_2_0": usb_2_0.toString(),
//     "designFeatures": designFeatures.toString(),
//     "maxLengthOfGraphicCard": maxLengthOfGraphicCard.toString(),
//     "powerSupplyFormFactor": powerSupplyFormFactor.toString(),
//   };
//
//   return data;
// }
}
