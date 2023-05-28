import 'package:json_annotation/json_annotation.dart';

part 'cpu_pcie_controller.g.dart';

@JsonSerializable()
class CPUPCIeController {
  final int id;
  String name;

  CPUPCIeController(this.id, this.name);

  factory CPUPCIeController.fromJson(Map<String, dynamic> json) =>
      _$CPUPCIeControllerFromJson(json);

  Map<String, dynamic> toJson() => _$CPUPCIeControllerToJson(this);

}
