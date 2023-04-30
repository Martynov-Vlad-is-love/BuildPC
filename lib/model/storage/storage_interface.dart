class StorageInterface {
  final int id;
  String storageInterface;

  StorageInterface(this.id, this.storageInterface);

  StorageInterface.fromJson(Map<String, dynamic> json)
      : id = json["id"] as int,
        storageInterface = json["storageInterface"] as String;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      "id": id.toString(),
      "storageInterface": storageInterface,
    };

    return data;
  }
}
