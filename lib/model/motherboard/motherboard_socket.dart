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
// MotherboardSocket.fromJson(Map<String, dynamic> json)
//     : id = json["id"] as int,
//       socket = json["socket"] as String;
//
// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = <String, dynamic>{
//     "id": id.toString(),
//     "socket": socket,
//   };
//
//   return data;
// }
}
