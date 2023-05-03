import 'package:json_annotation/json_annotation.dart';

part 'gpu_vendor.g.dart';

@JsonSerializable()
class GPUVendor {
  final int id;
  String vendor;

  GPUVendor(this.id, this.vendor);

  factory GPUVendor.fromJson(Map<String, dynamic> json) =>
      _$GPUVendorFromJson(json);

  Map<String, dynamic> toJson() => _$GPUVendorToJson(this);
// GPUVendor.fromJson(Map<String, dynamic> json)
//     : id = json["id"] as int,
//       vendor = json["vendor"] as String;
//
// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = <String, dynamic>{
//     "id": id.toString(),
//     "vendor": vendor,
//   };
//
//   return data;
// }
}
