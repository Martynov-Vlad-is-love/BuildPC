import 'package:buildpc/model/general/performance_level.dart';
import 'package:buildpc/model/general/producers.dart';
import 'package:buildpc/model/model.dart';
import 'package:buildpc/model/storage/storage_form_factor.dart';
import 'package:buildpc/model/storage/storage_interface.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hdd.g.dart';

@JsonSerializable()
class Hdd implements Model{
  final int? id;
  String? name;
  Producers? producer;
  int? storageSize;
  int? speed;
  StorageFormFactor? formFactor;
  StorageInterface? storageInterface;
  int? bufferSize;
  int? readingSpeed;
  int? writingSpeed;
  String? description;
  int? recommendedPrice;
  PerformanceLevel? performanceLevel;

  Hdd({
    this.id,
    required this.name,
    required this.producer,
    required this.storageSize,
    required this.speed,
    required this.formFactor,
    required this.storageInterface,
    required this.bufferSize,
    required this.readingSpeed,
    required this.writingSpeed,
    required this.description,
    required this.recommendedPrice,
    required this.performanceLevel,
  });

  factory Hdd.fromJson(Map<String, dynamic> json) => _$HddFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$HddToJson(this);

  @override
  List<String> parsedModels() {
    final List<String> fields = [
      id.toString(),
      '$name',
      '${producer?.name}',
      storageSize.toString(),
      speed.toString(),
      '${formFactor?.name}',
      '${storageInterface?.name}',
      bufferSize.toString(),
      readingSpeed.toString(),
      writingSpeed.toString(),
      '$description',
      recommendedPrice.toString(),
      '${performanceLevel?.level}'
    ];

    return fields;
  }
}
