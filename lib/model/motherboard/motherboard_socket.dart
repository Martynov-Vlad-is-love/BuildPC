class MotherboardSocket {
  final int id;
  String socket;

  MotherboardSocket(this.id, this.socket);

  MotherboardSocket.fromJson(Map<String, dynamic> json)
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
