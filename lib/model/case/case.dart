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
    this.description,
    this.recommendedPrice,
    this.performanceLevel, {
    required this.fansIncluded,
  });

  factory Case.fromJson(Map<String, dynamic> json) => _$CaseFromJson(json);

  Map<String, dynamic> toJson() => _$CaseToJson(this);
}
