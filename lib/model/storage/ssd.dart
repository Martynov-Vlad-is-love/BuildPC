import 'package:buildpc/model/general/performance_level.dart';
import 'package:buildpc/model/general/producers.dart';
import 'package:buildpc/model/storage/ssd_cells_type.dart';
import 'package:buildpc/model/storage/storage_form_factor.dart';
import 'package:buildpc/model/storage/storage_interface.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ssd.g.dart';

@JsonSerializable()
class Ssd {
  final int id;
  Producers producer;
  int storageSize;
  StorageFormFactor formFactor;
  StorageInterface interface;
  int bufferSize;
  int readingSpeed;
  int writingSpeed;
  SsdCellsType cellsType;
  String description;
  int recommendedPrice;
  PerformanceLevel performanceLevel;

  Ssd(
    this.id,
    this.producer,
    this.storageSize,
    this.formFactor,
    this.interface,
    this.bufferSize,
    this.readingSpeed,
    this.writingSpeed,
    this.cellsType,
    this.description,
    this.recommendedPrice,
    this.performanceLevel,
  );

  factory Ssd.fromJson(Map<String, dynamic> json) => _$SsdFromJson(json);

  Map<String, dynamic> toJson() => _$SsdToJson(this);
// Ssd.fromJson(Map<String, dynamic> json)
//     : id = json["id"] as int,
//       producer = json["producer"] as int,
//       storageSize = json["storageSize"] as int,
//       formFactor = json["formFactor"] as int,
//       interface = json["interface"] as int,
//       readingSpeed = json["readingSpeed"] as int,
//       writingSpeed = json["writingSpeed"] as int,
//       cellsType = json["cellsType"] as int,
//       size = json["size"] as int;
//
// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = <String, dynamic>{
//     "id": id.toString(),
//     "producer": producer,
//     "storageSize": storageSize,
//     "formFactor": formFactor,
//     "interface": interface,
//     "readingSpeed": readingSpeed,
//     "writingSpeed": writingSpeed,
//     "cellsType": cellsType,
//     "size": size,
//   };
//
//   return data;
// }
}
