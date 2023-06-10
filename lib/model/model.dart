import 'package:buildpc/model_utilis/model_util.dart';

abstract class Model{
  List<String?> parsedModels();
  Map<String, dynamic> toJson();
}
