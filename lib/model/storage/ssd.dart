import 'package:buildpc/model/general/performance_level.dart';
import 'package:buildpc/model/general/producers.dart';
import 'package:buildpc/model/model.dart';
import 'package:buildpc/model/storage/ssd_cells_type.dart';
import 'package:buildpc/model/storage/storage_form_factor.dart';
import 'package:buildpc/model/storage/storage_interface.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ssd.g.dart';

@JsonSerializable()
class Ssd implements Model{
  final int? id;
  Producers producer;
  int storageSize;
  StorageFormFactor formFactor;
  StorageInterface storageInterface;
  int bufferSize;
  int readingSpeed;
  int writingSpeed;
  SsdCellsType cellsType;
  String description;
  int recommendedPrice;
  PerformanceLevel performanceLevel;

  Ssd({
    this.id,
    required this.producer,
    required this.storageSize,
    required this.formFactor,
    required this.storageInterface,
    required this.bufferSize,
    required this.readingSpeed,
    required this.writingSpeed,
    required this.cellsType,
    required this.description,
    required this.recommendedPrice,
    required this.performanceLevel,
  });

  factory Ssd.fromJson(Map<String, dynamic> json) => _$SsdFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SsdToJson(this);

  @override
  List<String> parsedModels() {
    final fields = [
      id.toString(),
      producer.name,
      storageSize.toString(),
      formFactor.name,
      storageInterface.name,
      bufferSize.toString(),
      readingSpeed.toString(),
      writingSpeed.toString(),
      cellsType.name,
      description,
      recommendedPrice.toString(),
      performanceLevel.level
    ];

    return fields;
  }
}
