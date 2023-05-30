import 'package:buildpc/model/general/build_pc.dart';
import 'package:buildpc/model/general/like.dart';
import 'package:buildpc/model/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rating.g.dart';

@JsonSerializable()
class Rating implements Model{
  int id;
  BuildPC buildPc;
  List<Like> like;

  Rating(this.id, this.buildPc, this.like);

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RatingToJson(this);

  @override
  List<String> parsedModels() {
    final likeList = [];
    for(final l in like){
      likeList.add(l.parsedModels().toString());
    }

    final fields = [
      id.toString(),
      buildPc.parsedModels().toString(),
      likeList.toString()
    ];

    return fields;
  }
}
