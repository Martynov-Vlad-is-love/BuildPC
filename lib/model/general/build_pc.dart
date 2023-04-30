class BuildPC {
  final int id;
  String nameOfBuild;
  int userId;
  int motherboard;
  int processor;
  int graphicCard;
  int ram;
  int powerSupply;
  int hdd;
  int ssd;
  int pcCase;
  int cooler;
  int countOfLikes;
  int ratingId;

  BuildPC(
    this.id,
    this.nameOfBuild,
    this.userId,
    this.motherboard,
    this.processor,
    this.graphicCard,
    this.ram,
    this.powerSupply,
    this.hdd,
    this.ssd,
    this.pcCase,
    this.cooler,
    this.countOfLikes,
    this.ratingId,
  );

  BuildPC.fromJson(Map<String, dynamic> json)
      : id = json["id"] as int,
        nameOfBuild = json["nameOfBuild"] as String,
        userId = json["userId"] as int,
        motherboard = json["motherboard"] as int,
        processor = json["processor"] as int,
        graphicCard = json["graphicCard"] as int,
        ram = json["ram"] as int,
        powerSupply = json["powerSupply"] as int,
        hdd = json["hdd"] as int,
        ssd = json["ssd"] as int,
        pcCase = json["pcCase"] as int,
        cooler = json["cooler"] as int,
        countOfLikes = json["countOfLikes"] as int,
        ratingId = json["ratingId"] as int;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      "id": id.toString(),
      "nameOfBuild": nameOfBuild,
      "userId": userId,
      "motherboard": motherboard,
      "processor": processor,
      "graphicCard": graphicCard,
      "ram": ram,
      "powerSupply": powerSupply,
      "hdd": hdd,
      "ssd": ssd,
      "pcCase": pcCase,
      "cooler": cooler,
      "likeId": countOfLikes,
      "ratingId": ratingId,
    };

    return data;
  }
}
