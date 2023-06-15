import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/storage/storage_form_factor.dart';
import 'package:buildpc/repository/storage/storage_form_factor_repository.dart';
import 'package:flutter/cupertino.dart';

class StorageFormFactorController extends ChangeNotifier
    implements ModelControllerAbstract<StorageFormFactor> {
  final StorageFormFactorRepository _storageFormFactorRepository;

  StorageFormFactorController(this._storageFormFactorRepository);

  @override
  Future<List<StorageFormFactor>> getList() async {
    final result = _storageFormFactorRepository.getAllData();
    notifyListeners();

    return result;
  }

  @override
  Future<StorageFormFactor?> getDataById(int? id) async {
    final result = _storageFormFactorRepository.getDataById(id);
    notifyListeners();

    return result;
  }

  @override
  Future<void> updateData(StorageFormFactor data) async {
    await _storageFormFactorRepository.updateData(data);
    notifyListeners();
  }

  @override
  Future<void> postData(StorageFormFactor data) async {
    await _storageFormFactorRepository.postData(data);
    notifyListeners();
  }

  @override
  Future<void> delete(int id) async {
    await _storageFormFactorRepository.deleteData(id);
    notifyListeners();
  }
}
