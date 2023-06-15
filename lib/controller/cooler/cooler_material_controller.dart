import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/cooler/cooler_material.dart';
import 'package:buildpc/repository/cooler/cooler_material_repository.dart';
import 'package:flutter/cupertino.dart';

class CoolerMaterialController extends ChangeNotifier
    implements ModelControllerAbstract<CoolerMaterial> {
  final CoolerMaterialRepository _coolerMaterialRepository;

  CoolerMaterialController(this._coolerMaterialRepository);

  @override
  Future<List<CoolerMaterial>> getList() async {
    final result = _coolerMaterialRepository.getAllData();
    notifyListeners();

    return result;
  }

  @override
  Future<CoolerMaterial?> getDataById(int? id) async {
    final result = _coolerMaterialRepository.getDataById(id);
    notifyListeners();

    return result;
  }

  @override
  Future<void> updateData(CoolerMaterial data) async {
    await _coolerMaterialRepository.updateData(data);
    notifyListeners();
  }

  @override
  Future<void> postData(CoolerMaterial data) async {
    await _coolerMaterialRepository.postData(data);
    notifyListeners();
  }

  @override
  Future<void> delete(int id) async {
    await _coolerMaterialRepository.deleteData(id);
    notifyListeners();
  }
}
