import 'package:json_annotation/json_annotation.dart';
part 'case_producer.g.dart';

@JsonSerializable()
class CaseProducer {
  final int id;
  String producer;
  String size;

  CaseProducer(this.id, this.producer, this.size);

  factory CaseProducer.fromJson(Map<String, dynamic> json) =>
      _$CaseProducerFromJson(json);

  Map<String, dynamic> toJson() => _$CaseProducerToJson(this);
  // CaseProducer.fromJson(Map<String, dynamic> json)
  //     : id = json["id"] as int,
  //       producer = json["producer"] as String,
  //       size = json["size"] as String;
  //
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{
  //     "id": id.toString(),
  //     "producer": producer,
  //     "size": size,
  //   };
  //
  //   return data;
  // }
}
