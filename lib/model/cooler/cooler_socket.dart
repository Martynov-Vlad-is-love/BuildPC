import 'package:buildpc/model/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cooler_socket.g.dart';

@JsonSerializable()
class CoolerSocket implements Model {
  final int? id;
  String socket;

  CoolerSocket(this.id, this.socket);

  factory CoolerSocket.fromJson(Map<String, dynamic> json) =>
      _$CoolerSocketFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CoolerSocketToJson(this);

  @override
  List<String> parsedModels() {
    final fields = [id.toString(), socket];

    return fields;
  }
}
