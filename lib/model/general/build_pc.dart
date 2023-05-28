import 'package:buildpc/model/case/case.dart';
import 'package:buildpc/model/cooler/cooler.dart';
import 'package:buildpc/model/cpu/processor.dart';
import 'package:buildpc/model/general/rating.dart';
import 'package:buildpc/model/gpu/graphic_card.dart';
import 'package:buildpc/model/motherboard/motherboard.dart';
import 'package:buildpc/model/power/power_supply.dart';
import 'package:buildpc/model/ram/ram.dart';
import 'package:buildpc/model/storage/hdd.dart';
import 'package:buildpc/model/storage/ssd.dart';
import 'package:json_annotation/json_annotation.dart';

part 'build_pc.g.dart';

@JsonSerializable()
class BuildPC {
  final int id;
  String nameOfBuild;
  int userId;
  Motherboard motherboard;
  Processor processor;
  GraphicCard graphicCard;
  List<Ram> ram;
  PowerSupply powerSupply;
  List<Hdd> hdd;
  List<Ssd> ssd;
  Case pcCase;
  Cooler cooler;
  int countOfLikes;
  Rating ratingId;

  BuildPC(
    this.id,
    this.nameOfBuild,
    this.userId,
    this.motherboard,
    this.processor,
    this.graphicCard,
    this.ram,
    this.powerSupply,
    this.hdd,
    this.ssd,
    this.pcCase,
    this.cooler,
    this.countOfLikes,
    this.ratingId,
  );

  factory BuildPC.fromJson(Map<String, dynamic> json) =>
      _$BuildPCFromJson(json);

  Map<String, dynamic> toJson() => _$BuildPCToJson(this);
}
