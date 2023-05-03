import 'package:json_annotation/json_annotation.dart';

part 'gpu_technologies.g.dart';

@JsonSerializable()
class GPUTechnologies {
  final int id;
  String name;

  GPUTechnologies(this.id, this.name);

  factory GPUTechnologies.fromJson(Map<String, dynamic> json) =>
      _$GPUTechnologiesFromJson(json);

  Map<String, dynamic> toJson() => _$GPUTechnologiesToJson(this);
// GPUTechnologies.fromJson(Map<String, dynamic> json)
//     : id = json['id'] as int,
//       amdSAM = json['amdSAM'] as bool,
//       nvidiaRTX = json['nvidiaRTX'] as bool,
//       dlss = json['dlss'] as bool,
//       dlss2 = json['dlss2'] as bool,
//       dlss3 = json['dlss3'] as bool,
//       nvidiaReflex = json['nvidiaReflex'] as bool,
//       nvidiaGSync = json['nvidiaGSync'] as bool,
//       vr = json['vr'] as bool,
//       directXRaytracing = json['directXRaytracing'] as bool,
//       amdFreeSync = json['amdFreeSync'] as bool;
//
// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = <String, dynamic>{
//     "id": id.toString(),
//     "amdSAM": amdSAM.toString(),
//     "nvidiaRTX": nvidiaRTX.toString(),
//     "dlss": dlss.toString(),
//     "dlss2": dlss2.toString(),
//     "dlss3": dlss3.toString(),
//     "nvidiaReflex": nvidiaReflex.toString(),
//     "nvidiaGSync": nvidiaGSync.toString(),
//     "vr": vr.toString(),
//     "directXRaytracing": directXRaytracing.toString(),
//     "amdFreeSync": amdFreeSync.toString()
//   };
//
//   return data;
// }
}
