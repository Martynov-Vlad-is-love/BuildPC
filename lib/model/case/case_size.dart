import 'package:buildpc/model/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'case_size.g.dart';

@JsonSerializable()
class CaseSize implements Model{
  final int? id;
  String size;

  CaseSize(this.id, {required this.size});

  factory CaseSize.fromJson(Map<String, dynamic> json) =>
      _$CaseSizeFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CaseSizeToJson(this);

  @override
  List<String> parsedModels() {
    final fields = [id.toString(), size];

    return fields;
  }
}
