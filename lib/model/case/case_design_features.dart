import 'package:buildpc/model/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'case_design_features.g.dart';

@JsonSerializable()
class CaseDesignFeatures implements Model{
  final int? id;
  String designFeatures;

  CaseDesignFeatures(this.id, this.designFeatures);

  factory CaseDesignFeatures.fromJson(Map<String, dynamic> json) =>
      _$CaseDesignFeaturesFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CaseDesignFeaturesToJson(this);

  @override
  List<String> parsedModels() {
    final List<String> fields = [
      id.toString(),
      designFeatures
    ];

    return fields;
  }
}
