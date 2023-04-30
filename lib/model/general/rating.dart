class Rating {
  int id;
  int buildPcId;
  int countOfLikes;

  Rating(this.id, this.buildPcId, this.countOfLikes);

  Rating.fromJson(Map<String, dynamic> json)
      : id = json["id"] as int,
        buildPcId = json["buildPcId"] as int,
        countOfLikes = json["countOfLikes"] as int;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      "id": id.toString(),
      "buildPcId": buildPcId,
      "countOfLikes": countOfLikes,
    };

    return data;
  }
}
