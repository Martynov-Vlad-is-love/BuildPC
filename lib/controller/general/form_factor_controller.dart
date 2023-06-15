import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/general/form_factor.dart';
import 'package:buildpc/repository/general/form_factor_repository.dart';
import 'package:flutter/cupertino.dart';

class FormFactorController extends ChangeNotifier
    implements ModelControllerAbstract<FormFactor> {
  final FormFactorRepository _formFactorRepository;

  FormFactorController(this._formFactorRepository);

  @override
  Future<List<FormFactor>> getList() async {
    final data = _formFactorRepository.getAllData();
    notifyListeners();

    return data;
  }

  @override
  Future<FormFactor?> getDataById(int? id) async {
    final data = _formFactorRepository.getDataById(id);
    notifyListeners();

    return data;
  }

  @override
  Future<void> updateData(FormFactor data) async {
    await _formFactorRepository.updateData(data);
    notifyListeners();
  }

  @override
  Future<void> postData(FormFactor data) async {
    await _formFactorRepository.postData(data);
    notifyListeners();
  }

  @override
  Future<void> delete(int id) async {
    await _formFactorRepository.deleteData(id);
    notifyListeners();
  }
}
