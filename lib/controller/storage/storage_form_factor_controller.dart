import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/storage/storage_form_factor.dart';
import 'package:buildpc/repository/storage/storage_form_factor_repository.dart';

class StorageFormFactorController
    implements ModelControllerAbstract<StorageFormFactor> {
  final StorageFormFactorRepository _storageFormFactorRepository;

  StorageFormFactorController(this._storageFormFactorRepository);

  @override
  Future<List<StorageFormFactor>> getList() async {
    return _storageFormFactorRepository.getAllData();
  }

  @override
  Future<StorageFormFactor?> getDataById(int? id) async {
    return _storageFormFactorRepository.getDataById(id);
  }

  @override
  Future<void> updateData(StorageFormFactor data) async {
    await _storageFormFactorRepository.updateData(data);
  }

  @override
  Future<StorageFormFactor?> postData(StorageFormFactor data) async {
    await _storageFormFactorRepository.postData(data);

    return getDataById(data.id);
  }

  @override
  Future<void> delete(int id) async {
    await _storageFormFactorRepository.deleteData(id);
  }
}
