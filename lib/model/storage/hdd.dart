import 'package:buildpc/model/general/performance_level.dart';
import 'package:buildpc/model/storage/storage_form_factor.dart';
import 'package:buildpc/model/storage/storage_interface.dart';
import 'package:buildpc/model/storage/storage_producer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hdd.g.dart';

@JsonSerializable()
class Hdd {
  final int id;
  StorageProducer producer;
  int storageSize;
  int speed;
  StorageFormFactor formFactor;
  StorageInterface storageInterface;
  int bufferSize;
  int readingSpeed;
  int writingSpeed;
  String description;
  int recommendedPrice;
  PerformanceLevel performanceLevel;

  Hdd(
    this.id,
    this.producer,
    this.storageSize,
    this.speed,
    this.formFactor,
    this.storageInterface,
    this.bufferSize,
    this.readingSpeed,
    this.writingSpeed,
    this.description,
    this.recommendedPrice,
    this.performanceLevel,
  );

  factory Hdd.fromJson(Map<String, dynamic> json) => _$HddFromJson(json);

  Map<String, dynamic> toJson() => _$HddToJson(this);
// Hdd.fromJson(Map<String, dynamic> json)
//     : id = json["id"] as int,
//       producer = json["producer"] as int,
//       storageSize = json["storageSize"] as int,
//       speed = json["speed"] as int,
//       formFactor = json["formFactor"] as int,
//       interface = json["interface"] as int,
//       bufferSize = json["bufferSize"] as int,
//       readingSpeed = json["readingSpeed"] as int,
//       writingSpeed = json["writingSpeed"] as int;
//
// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = <String, dynamic>{
//     "id": id.toString(),
//     "producer": producer,
//     "storageSize": storageSize,
//     "speed": speed,
//     "formFactor": formFactor,
//     "interface": interface,
//     "bufferSize": bufferSize,
//     "readingSpeed": readingSpeed,
//     "writingSpeed": writingSpeed,
//   };
//
//   return data;
// }
}
