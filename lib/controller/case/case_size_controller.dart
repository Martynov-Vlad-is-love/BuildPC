import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/case/case_size.dart';
import 'package:buildpc/repository/case/case_size_repository.dart';
import 'package:flutter/cupertino.dart';

class CaseSizeController extends ChangeNotifier
    implements ModelControllerAbstract<CaseSize> {
  final CaseSizeRepository _caseSizeRepository;

  CaseSizeController(this._caseSizeRepository);

  @override
  Future<List<CaseSize>> getList() async {
    final result = _caseSizeRepository.getAllData();
    notifyListeners();

    return result;
  }

  @override
  Future<CaseSize?> getDataById(int? id) async {
    final result = _caseSizeRepository.getDataById(id);
    notifyListeners();

    return result;
  }

  @override
  Future<void> updateData(CaseSize data) async {
    await _caseSizeRepository.updateData(data);
    notifyListeners();
  }

  @override
  Future<void> postData(CaseSize data) async {
    await _caseSizeRepository.postData(data);
    notifyListeners();
  }

  @override
  Future<void> delete(int id) async {
    await _caseSizeRepository.deleteData(id);
    notifyListeners();
  }
}
