import 'package:buildpc/model/general/build_pc.dart';
import 'package:buildpc/model/general/like.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rating.g.dart';

@JsonSerializable()
class Rating {
  int id;
  BuildPC buildPc;
  List<Like> like;

  Rating(this.id, this.buildPc, this.like);

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);

  Map<String, dynamic> toJson() => _$RatingToJson(this);
}
