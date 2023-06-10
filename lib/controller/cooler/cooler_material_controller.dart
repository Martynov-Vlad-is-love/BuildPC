import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/cooler/cooler_material.dart';
import 'package:buildpc/repository/cooler/cooler_material_repository.dart';

class CoolerMaterialController
    implements ModelControllerAbstract<CoolerMaterial> {
  final CoolerMaterialRepository _coolerMaterialRepository;

  CoolerMaterialController(this._coolerMaterialRepository);

  @override
  Future<List<CoolerMaterial>> getList() async {
    return _coolerMaterialRepository.getAllData();
  }

  @override
  Future<CoolerMaterial?> getDataById(int? id) async {
    return _coolerMaterialRepository.getDataById(id);
  }

  @override
  Future<void> updateData(CoolerMaterial data) async {
    await _coolerMaterialRepository.updateData(data);
  }

  @override
  Future<void> postData(CoolerMaterial data) async {
    await _coolerMaterialRepository.postData(data);
  }

  @override
  Future<void> delete(int id) async {
    await _coolerMaterialRepository.deleteData(id);
  }
}
