import 'package:buildpc/model/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'producers.g.dart';

@JsonSerializable()
class Producers implements Model{
  final int id;
  String name;

  Producers(this.id, this.name);

  factory Producers.fromJson(Map<String, dynamic> json) =>
      _$ProducersFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProducersToJson(this);

  @override
  List<String> parsedModels() {
    final fields = [id.toString(), name];

    return fields;
  }

}
