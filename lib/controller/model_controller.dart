import 'package:buildpc/model/model.dart';
import 'package:flutter/foundation.dart';

class ModelController extends ChangeNotifier {
  List<Model?> _model = [];
  Model? _currentModel;
  Map<String, List<Model?>> _modelMap = {};

  Map<String, List<Model?>> get modelMap => _modelMap;

  List<Model?> get model => _model;

  Model? get currentModel => _currentModel;

  void addNewKV(String key, List<Model?> value){
    _modelMap[key] = value;
    notifyListeners();
  }
  void removeFromMap(String key){
    _modelMap.remove(key);
    notifyListeners();
  }

  void clearMap(){
    _modelMap = {};
  }

  void refresh(){
    notifyListeners();
  }

  void setCurrentModel(Model? curModel) {
    _currentModel = curModel;
    notifyListeners();
  }

  void setAllModel(List<Model?> curModel) {
    _model = curModel;
    notifyListeners();
  }

  void addModelToList(Model model) {
    _model.add(model);
    notifyListeners();
  }

  void deleteModelToList(Model model) {
    _model.remove(model);
    notifyListeners();
  }
}
