class SSDCellsType{
  final int id;
  String cellsType;

  SSDCellsType(this.id, this.cellsType);

  SSDCellsType.fromJson(Map<String, dynamic> json)
      : id = json["id"] as int,
        cellsType = json["cellsType"] as String;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      "id": id.toString(),
      "cellsType": cellsType,
    };

    return data;
  }
}
