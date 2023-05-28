import 'package:json_annotation/json_annotation.dart';

part 'case_design_features.g.dart';

@JsonSerializable()
class CaseDesignFeatures {
  final int id;
  String designFeatures;

  CaseDesignFeatures(this.id, this.designFeatures);

  factory CaseDesignFeatures.fromJson(Map<String, dynamic> json) =>
      _$CaseDesignFeaturesFromJson(json);

  Map<String, dynamic> toJson() => _$CaseDesignFeaturesToJson(this);
}
