class StorageProducer {
  final int id;
  String storageProducer;

  StorageProducer(this.id, this.storageProducer);

  StorageProducer.fromJson(Map<String, dynamic> json)
      : id = json["id"] as int,
        storageProducer = json["storageProducer"] as String;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      "id": id.toString(),
      "storageProducer": storageProducer,
    };

    return data;
  }
}
