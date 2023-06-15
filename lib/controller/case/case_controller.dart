import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/case/case.dart';
import 'package:buildpc/repository/case/case_repository.dart';
import 'package:flutter/cupertino.dart';

class CaseController extends ChangeNotifier
    implements ModelControllerAbstract<Case> {
  final CaseRepository _caseRepository;

  CaseController(this._caseRepository);

  @override
  Future<List<Case>> getList() async {
    final result = _caseRepository.getAllData();
    notifyListeners();

    return result;
  }

  @override
  Future<Case?> getDataById(int? id) async {
    final result = _caseRepository.getDataById(id);
    notifyListeners();

    return result;
  }

  @override
  Future<void> updateData(Case data) async {
    await _caseRepository.updateData(data);
    notifyListeners();
  }

  @override
  Future<void> postData(Case data) async {
    await _caseRepository.postData(data);
    notifyListeners();
  }

  @override
  Future<void> delete(int id) async {
    await _caseRepository.deleteData(id);
    notifyListeners();
  }
}
