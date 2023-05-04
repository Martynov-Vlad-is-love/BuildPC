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
// CoolerSocket.fromJson(Map<String, dynamic> json)
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
