import 'package:buildpc/model/case/case_design_features.dart';
import 'package:buildpc/model/case/case_power_supply_location.dart';
import 'package:buildpc/model/case/case_size.dart';
import 'package:buildpc/model/general/form_factor.dart';
import 'package:buildpc/model/general/performance_level.dart';
import 'package:buildpc/model/general/producers.dart';
import 'package:buildpc/model/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'case.g.dart';

@JsonSerializable()
class Case implements Model{
  final int? id;
  String name;
  CaseSize size;
  Producers producer;
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

  Case({
    this.id,
    required this.name,
    required this.size,
    required this.formFactor,
    required this.producer,
    required this.powerSupplyLocation,
    required this.fansIncluded,
    required this.usb_3_2,
    required this.usb_3_0,
    required this.usb_2_0,
    required this.designFeatures,
    required this.maxLengthOfGraphicCard,
    required this.description,
    required this.recommendedPrice,
    required this.performanceLevel,
  });

  factory Case.fromJson(Map<String, dynamic> json) => _$CaseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CaseToJson(this);



  @override
  List<String> parsedModels() {
    final formFactorField = [];
    for(final form in formFactor){
      formFactorField.add(form.name);
    }
    final designFeaturesField = [];
    for(final feature in designFeatures){
      designFeaturesField.add(feature.designFeatures);
    }

    final List<String> fields = [
      id.toString(),
      name,
      size.size,
      formFactorField.toString(),
      producer.name,
      powerSupplyLocation.powerSupplyLocation,
      fansIncluded.toString(),
      usb_3_2.toString(),
      usb_3_0.toString(),
      usb_2_0.toString(),
      designFeaturesField.toString(),
      maxLengthOfGraphicCard.toString(),
      description,
      recommendedPrice.toString(),
      performanceLevel.level
    ];

    return fields;
  }
}
