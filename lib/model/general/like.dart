import 'package:buildpc/model/general/build_pc.dart';
import 'package:buildpc/model/general/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'like.g.dart';

@JsonSerializable()
class Like {
  final int id;
  BuildPC buildPcId;
  User user;

  Like(this.id, this.buildPcId, this.user);

  factory Like.fromJson(Map<String, dynamic> json) => _$LikeFromJson(json);

  Map<String, dynamic> toJson() => _$LikeToJson(this);
}
