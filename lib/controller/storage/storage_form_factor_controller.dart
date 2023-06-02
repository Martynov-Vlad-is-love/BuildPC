import 'package:buildpc/model/storage/storage_form_factor.dart';
import 'package:buildpc/repository/storage/storage_form_factor_repository.dart';

class StorageFormFactorController {
  final StorageFormFactorRepository _storageFormFactorRepository;

  StorageFormFactorController(this._storageFormFactorRepository);

  Future<List<StorageFormFactor>> getList() async {
    return _storageFormFactorRepository.getAllData();
  }

  Future<StorageFormFactor?> getDataById(int? id) async {
    return _storageFormFactorRepository.getDataById(id);
  }

  Future<void> updateData(StorageFormFactor data) async {
    await _storageFormFactorRepository.updateData(data);
  }

  Future<StorageFormFactor?> postData(StorageFormFactor data) async {
    await _storageFormFactorRepository.postData(data);

    return getDataById(data.id);
  }

  Future<void> delete(int id) async {
    await _storageFormFactorRepository.deleteData(id);
  }
}
