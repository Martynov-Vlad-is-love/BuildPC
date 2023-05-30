import 'package:buildpc/model/general/performance_level.dart';
import 'package:buildpc/model/general/producers.dart';
import 'package:buildpc/model/model.dart';
import 'package:buildpc/model/storage/storage_form_factor.dart';
import 'package:buildpc/model/storage/storage_interface.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hdd.g.dart';

@JsonSerializable()
class Hdd implements Model{
  final int id;
  Producers producer;
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

  @override
  Map<String, dynamic> toJson() => _$HddToJson(this);

  @override
  List<String> parsedModels() {
    final fields = [
      id.toString(),
      producer.name,
      storageSize.toString(),
      speed.toString(),
      formFactor.name,
      storageInterface.name,
      bufferSize.toString(),
      readingSpeed.toString(),
      writingSpeed.toString(),
      description,
      recommendedPrice.toString(),
      performanceLevel.level
    ];

    return fields;
  }
}
