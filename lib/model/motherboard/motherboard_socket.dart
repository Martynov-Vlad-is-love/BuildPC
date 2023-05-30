import 'package:buildpc/model/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'motherboard_socket.g.dart';

@JsonSerializable()
class MotherboardSocket implements Model {
  final int id;
  String socket;

  MotherboardSocket(this.id, this.socket);

  factory MotherboardSocket.fromJson(Map<String, dynamic> json) =>
      _$MotherboardSocketFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MotherboardSocketToJson(this);

  @override
  List<String> parsedModels() {
    final fields = [id.toString(), socket];

    return fields;
  }
}
