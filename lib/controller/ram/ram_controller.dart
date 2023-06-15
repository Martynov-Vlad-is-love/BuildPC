import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/ram/ram.dart';
import 'package:buildpc/repository/ram/ram_repository.dart';
import 'package:flutter/cupertino.dart';

class RamController extends ChangeNotifier
    implements ModelControllerAbstract<Ram> {
  final RamRepository _ramRepository;

  RamController(this._ramRepository);

  @override
  Future<List<Ram>> getList() async {
    final result = _ramRepository.getAllData();
    notifyListeners();

    return result;
  }

  @override
  Future<Ram?> getDataById(int? id) async {
    final result = _ramRepository.getDataById(id);
    notifyListeners();

    return result;
  }

  @override
  Future<void> updateData(Ram data) async {
    await _ramRepository.updateData(data);
    notifyListeners();
  }

  @override
  Future<void> postData(Ram data) async {
    await _ramRepository.postData(data);
    notifyListeners();
  }

  @override
  Future<void> delete(int id) async {
    await _ramRepository.deleteData(id);
    notifyListeners();
  }
}
