import 'package:json_annotation/json_annotation.dart';

part 'producers.g.dart';

@JsonSerializable()
class Producers {
  final int id;
  String name;

  Producers(this.id, this.name);

  factory Producers.fromJson(Map<String, dynamic> json) =>
      _$ProducersFromJson(json);

  Map<String, dynamic> toJson() => _$ProducersToJson(this);
}
