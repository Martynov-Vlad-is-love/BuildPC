import 'package:buildpc/model/general/build_pc.dart';
import 'package:buildpc/model/general/user.dart';
import 'package:buildpc/model/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'like.g.dart';

@JsonSerializable()
class Like implements Model{
  final int? id;
  BuildPC? buildPc;
  User? user;

  Like({this.id, required this.buildPc, required this.user});

  factory Like.fromJson(Map<String, dynamic> json) => _$LikeFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LikeToJson(this);

  @override
  List<String> parsedModels() {
    final fields = [
      id.toString(),
      '${user?.username}',
      '${buildPc?.nameOfBuild}'
    ];

    return fields;
  }
}
