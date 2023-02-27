class CPUTechnologies {
  final int id;
  bool mmx;
  bool sse;
  bool sse2;
  bool sse3;
  bool sse4;
  bool aes;
  bool avx;
  bool turboBoost;
  bool hyperThread;
  bool vtx;
  bool vd;
  bool f16c;
  bool fma3;

  CPUTechnologies(
    this.id, {
    required this.mmx,
    required this.sse,
    required this.sse2,
    required this.sse3,
    required this.sse4,
    required this.aes,
    required this.avx,
    required this.turboBoost,
    required this.hyperThread,
    required this.vtx,
    required this.vd,
    required this.f16c,
    required this.fma3,
  });

  CPUTechnologies.fromJson(Map<String, dynamic> json)
      : id = json["id"] as int,
        mmx = json["mmx"] as bool,
        sse = json["sse"] as bool,
        sse2 = json["sse2"] as bool,
        sse3 = json["sse3"] as bool,
        sse4 = json["sse4"] as bool,
        aes = json["aes"] as bool,
        avx = json["avx"] as bool,
        turboBoost = json["turboBoost"] as bool,
        hyperThread = json["hyperThread"] as bool,
        vtx = json["vtx"] as bool,
        vd = json["vd"] as bool,
        f16c = json["f16c"] as bool,
        fma3 = json["fma3"] as bool;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      "id": id.toString(),
      "mmx": mmx.toString(),
      "sse": sse.toString(),
      "sse2": sse2.toString(),
      "sse3": sse3.toString(),
      "sse4": sse4.toString(),
      "aes": aes.toString(),
      "avx": avx.toString(),
      "turboBoost": turboBoost.toString(),
      "hyperThread": hyperThread.toString(),
      "vtx": vtx.toString(),
      "vd": vd.toString(),
      "f16c": f16c.toString(),
      "fma3": fma3.toString(),
    };

    return data;
  }
}
