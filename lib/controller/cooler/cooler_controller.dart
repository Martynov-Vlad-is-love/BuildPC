import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/cooler/cooler.dart';
import 'package:buildpc/repository/cooler/cooler_repository.dart';
import 'package:flutter/cupertino.dart';

class CoolerController extends ChangeNotifier
    implements ModelControllerAbstract<Cooler> {
  final CoolerRepository _coolerRepository;

  CoolerController(this._coolerRepository);

  @override
  Future<List<Cooler>> getList() async {
    final result = _coolerRepository.getAllData();
    notifyListeners();

    return result;
  }

  @override
  Future<Cooler?> getDataById(int? id) async {
    final result = _coolerRepository.getDataById(id);
    notifyListeners();

    return result;
  }

  @override
  Future<void> updateData(Cooler data) async {
    await _coolerRepository.updateData(data);
    notifyListeners();
  }

  @override
  Future<void> postData(Cooler data) async {
    await _coolerRepository.postData(data);
    notifyListeners();
  }

  @override
  Future<void> delete(int id) async {
    await _coolerRepository.deleteData(id);
    notifyListeners();
  }
}
