class Like {
  final int id;
  int buildPcId;
  int userId;

  Like(this.id, this.buildPcId, this.userId);

  Like.fromJson(Map<String, dynamic> json)
      : id = json["id"] as int,
        buildPcId = json["buildPcId"] as int,
        userId = json["userId"] as int;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      "id": id.toString(),
      "buildPcId": buildPcId,
      "userId": userId,
    };

    return data;
  }
}
