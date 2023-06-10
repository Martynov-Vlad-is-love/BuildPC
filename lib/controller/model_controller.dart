import 'package:buildpc/model/model.dart';
import 'package:flutter/foundation.dart';

class ModelController extends ChangeNotifier{
  List<Model?> _model = [];
  Model? _currentModel;

  List<Model?> get model => _model;
  Model? get currentModel => _currentModel;

  void setCurrentModel(Model? curModel){
    _currentModel = curModel;
    notifyListeners();
  }
  void setAllModel(List<Model?> curModel){
    _model = curModel;
    notifyListeners();
  }
  void addModelToList(Model model){
    _model.add(model);
    notifyListeners();
  }

  void deleteModelToList(Model model){
    _model.remove(model);
    notifyListeners();
  }
}
