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
  StorageInterface storageInterface;
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
    this.storageInterface,
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
}
