class CoolerSocket{
  int id;
  String socket;

  CoolerSocket(this.id, this.socket);

  CoolerSocket.fromJson(Map<String, dynamic> json)
      : id = json["id"] as int,
        socket = json["socket"] as String;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      "id": id.toString(),
      "socket": socket,
    };

    return data;
  }
}
