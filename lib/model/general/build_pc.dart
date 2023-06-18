import 'package:buildpc/model/case/case.dart';
import 'package:buildpc/model/cooler/cooler.dart';
import 'package:buildpc/model/cpu/processor.dart';
import 'package:buildpc/model/general/rating.dart';
import 'package:buildpc/model/general/user.dart';
import 'package:buildpc/model/gpu/graphic_card.dart';
import 'package:buildpc/model/model.dart';
import 'package:buildpc/model/motherboard/motherboard.dart';
import 'package:buildpc/model/power/power_supply.dart';
import 'package:buildpc/model/ram/ram.dart';
import 'package:buildpc/model/storage/hdd.dart';
import 'package:buildpc/model/storage/ssd.dart';
import 'package:json_annotation/json_annotation.dart';

part 'build_pc.g.dart';

@JsonSerializable()
class BuildPC implements Model {
  final int? id;
  String? nameOfBuild;
  User? user;
  Motherboard? motherboard;
  Processor? processor;
  GraphicCard? graphicCard;
  List<Ram?> ram;
  PowerSupply? powerSupply;
  List<Hdd?> hdd;
  List<Ssd?> ssd;
  Case? pcCase;
  Cooler? cooler;
  int? countOfLikes;
  Rating? ratingId;
  int? totalPrice;

  BuildPC({
    this.id,
    required this.nameOfBuild,
    required this.user,
    required this.motherboard,
    required this.processor,
    required this.graphicCard,
    required this.ram,
    required this.powerSupply,
    required this.hdd,
    required this.ssd,
    required this.pcCase,
    required this.cooler,
    required this.countOfLikes,
    required this.ratingId,
    required this.totalPrice,
  });

  factory BuildPC.fromJson(Map<String, dynamic> json) =>
      _$BuildPCFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BuildPCToJson(this);

  @override
  List<String> parsedModels() {
    final ramList = [];
    for (final plate in ram) {
      ramList.add(plate?.name);
    }
    final List<String?> hddList = [];
    for (final disc in hdd) {
      hddList.add('${disc?.name}');
    }
    final List<String?> ssdList = [];
    for (final disc in ssd) {
      ssdList.add(disc?.name);
    }

    final fields = [
      id.toString(),
      'Build name: $nameOfBuild',
      'User: ${user?.name}',
      'Motherboard: ${motherboard?.name}',
      'Processor: ${processor?.name}',
      'Graphic card: ${graphicCard?.name}',
      'RAM: ${ramList.toString()}',
      'Power supply: ${powerSupply?.name}',
      'HDD: ${hddList.toString()}',
      'SSD: ${ssdList.toString()}',
      'Case: ${pcCase?.name}',
      'Cooler: ${cooler?.name}',
      'Count of likes: ${countOfLikes.toString()}',
      'Rating id: ${ratingId.toString()}',
      'Total price: ${totalPrice.toString()}'
    ];

    return fields;
  }
}
