import 'package:buildpc/model/cooler/cooler_material.dart';
import 'package:buildpc/repository/cooler/cooler_material_repository.dart';

class CoolerMaterialController {
  final CoolerMaterialRepository _coolerMaterialRepository;

  CoolerMaterialController(this._coolerMaterialRepository);

  Future<List<CoolerMaterial>> getList() async {
    return _coolerMaterialRepository.getAllData();
  }

  Future<CoolerMaterial?> getDataById(int? id) async {
    return _coolerMaterialRepository.getDataById(id);
  }

  Future<void> updateData(CoolerMaterial data) async {
    await _coolerMaterialRepository.updateData(data);
  }

  Future<CoolerMaterial?> postData(CoolerMaterial data) async {
    await _coolerMaterialRepository.postData(data);

    return getDataById(data.id);
  }

  Future<void> delete(int id) async {
    await _coolerMaterialRepository.deleteData(id);
  }
}
