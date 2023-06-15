import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/storage/storage_interface.dart';
import 'package:buildpc/repository/storage/storage_interface_repository.dart';
import 'package:flutter/cupertino.dart';

class StorageInterfaceController extends ChangeNotifier
    implements ModelControllerAbstract<StorageInterface> {
  final StorageInterfaceRepository _storageInterfaceRepositoryRepository;

  StorageInterfaceController(this._storageInterfaceRepositoryRepository);

  @override
  Future<List<StorageInterface>> getList() async {
    final result = _storageInterfaceRepositoryRepository.getAllData();
    notifyListeners();

    return result;
  }

  @override
  Future<StorageInterface?> getDataById(int? id) async {
    final result = _storageInterfaceRepositoryRepository.getDataById(id);
    notifyListeners();

    return result;
  }

  @override
  Future<void> updateData(StorageInterface data) async {
    await _storageInterfaceRepositoryRepository.updateData(data);
    notifyListeners();
  }

  @override
  Future<void> postData(StorageInterface data) async {
    await _storageInterfaceRepositoryRepository.postData(data);
    notifyListeners();
  }

  @override
  Future<void> delete(int id) async {
    await _storageInterfaceRepositoryRepository.deleteData(id);
    notifyListeners();
  }
}
