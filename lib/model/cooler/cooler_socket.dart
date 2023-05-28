import 'package:json_annotation/json_annotation.dart';

part 'cooler_socket.g.dart';

@JsonSerializable()
class CoolerSocket {
  final int id;
  String socket;

  CoolerSocket(this.id, this.socket);

  factory CoolerSocket.fromJson(Map<String, dynamic> json) =>
      _$CoolerSocketFromJson(json);

  Map<String, dynamic> toJson() => _$CoolerSocketToJson(this);
}
