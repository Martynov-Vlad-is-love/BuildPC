import 'package:json_annotation/json_annotation.dart';

part 'motherboard_socket.g.dart';

@JsonSerializable()
class MotherboardSocket {
  final int id;
  String socket;

  MotherboardSocket(this.id, this.socket);

  factory MotherboardSocket.fromJson(Map<String, dynamic> json) =>
      _$MotherboardSocketFromJson(json);

  Map<String, dynamic> toJson() => _$MotherboardSocketToJson(this);
}
