import 'package:json_annotation/json_annotation.dart';

part 'cpu_technologies.g.dart';

@JsonSerializable()
class CPUTechnologies {
  final int id;
  String name;

  CPUTechnologies(this.id, this.name);

  factory CPUTechnologies.fromJson(Map<String, dynamic> json) =>
      _$CPUTechnologiesFromJson(json);

  Map<String, dynamic> toJson() => _$CPUTechnologiesToJson(this);
  // CPUTechnologies.fromJson(Map<String, dynamic> json)
  //     : id = json["id"] as int,
  //       mmx = json["mmx"] as bool,
  //       sse = json["sse"] as bool,
  //       sse2 = json["sse2"] as bool,
  //       sse3 = json["sse3"] as bool,
  //       sse4 = json["sse4"] as bool,
  //       aes = json["aes"] as bool,
  //       avx = json["avx"] as bool,
  //       turboBoost = json["turboBoost"] as bool,
  //       hyperThread = json["hyperThread"] as bool,
  //       vtx = json["vtx"] as bool,
  //       vd = json["vd"] as bool,
  //       f16c = json["f16c"] as bool,
  //       fma3 = json["fma3"] as bool;
  //
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{
  //     "id": id.toString(),
  //     "mmx": mmx.toString(),
  //     "sse": sse.toString(),
  //     "sse2": sse2.toString(),
  //     "sse3": sse3.toString(),
  //     "sse4": sse4.toString(),
  //     "aes": aes.toString(),
  //     "avx": avx.toString(),
  //     "turboBoost": turboBoost.toString(),
  //     "hyperThread": hyperThread.toString(),
  //     "vtx": vtx.toString(),
  //     "vd": vd.toString(),
  //     "f16c": f16c.toString(),
  //     "fma3": fma3.toString(),
  //   };
  //
  //   return data;
  // }
}
