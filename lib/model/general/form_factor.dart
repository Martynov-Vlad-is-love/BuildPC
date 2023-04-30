class FormFactor {
  final int id;
  String formFactor;

  FormFactor(this.id, this.formFactor);

  FormFactor.fromJson(Map<String, dynamic> json)
      : id = json["id"] as int,
        formFactor = json["formFactor"] as String;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      "id": id.toString(),
      "formFactor": formFactor,
    };

    return data;
  }
}
