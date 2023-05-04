import 'package:json_annotation/json_annotation.dart';

part 'case_size.g.dart';

@JsonSerializable()
class CaseSize {
  final int id;
  String size;

  CaseSize(this.id, this.size);

  factory CaseSize.fromJson(Map<String, dynamic> json) =>
      _$CaseSizeFromJson(json);

  // CaseSize.fromJson(Map<String, dynamic> json)
  //     : id = json["id"] as int,
  //       size = json["size"] as String;

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{
  //     "id": id.toString(),
  //     "size": size,
  //   };
  //
  //   return data;
  // }
  Map<String, dynamic> toJson() => _$CaseSizeToJson(this);
}
