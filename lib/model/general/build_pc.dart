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
// BuildPC.fromJson(Map<String, dynamic> json)
//     : id = json["id"] as int,
//       nameOfBuild = json["nameOfBuild"] as String,
//       userId = json["userId"] as int,
//       motherboard = json["motherboard"] as int,
//       processor = json["processor"] as int,
//       graphicCard = json["graphicCard"] as int,
//       ram = json["ram"] as int,
//       powerSupply = json["powerSupply"] as int,
//       hdd = json["hdd"] as int,
//       ssd = json["ssd"] as int,
//       pcCase = json["pcCase"] as int,
//       cooler = json["cooler"] as int,
//       countOfLikes = json["countOfLikes"] as int,
//       ratingId = json["ratingId"] as int;
//
// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = <String, dynamic>{
//     "id": id.toString(),
//     "nameOfBuild": nameOfBuild,
//     "userId": userId,
//     "motherboard": motherboard,
//     "processor": processor,
//     "graphicCard": graphicCard,
//     "ram": ram,
//     "powerSupply": powerSupply,
//     "hdd": hdd,
//     "ssd": ssd,
//     "pcCase": pcCase,
//     "cooler": cooler,
//     "likeId": countOfLikes,
//     "ratingId": ratingId,
//   };
//
//   return data;
// }
}
