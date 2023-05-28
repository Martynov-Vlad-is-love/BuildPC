import 'package:json_annotation/json_annotation.dart';

part 'case_size.g.dart';

@JsonSerializable()
class CaseSize {
  final int id;
  String size;

  CaseSize(this.id, this.size);

  factory CaseSize.fromJson(Map<String, dynamic> json) =>
      _$CaseSizeFromJson(json);

  Map<String, dynamic> toJson() => _$CaseSizeToJson(this);
}
