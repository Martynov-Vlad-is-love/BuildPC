import 'package:buildpc/model/storage/storage_interface.dart';
import 'package:buildpc/repository/storage/storage_interface_repository.dart';

class StorageInterfaceController {
  final StorageInterfaceRepository _storageInterfaceRepositoryRepository;

  StorageInterfaceController(this._storageInterfaceRepositoryRepository);

  Future<List<StorageInterface>> getList() async {
    return _storageInterfaceRepositoryRepository.getAllData();
  }

  Future<StorageInterface?> getDataById(int? id) async {
    return _storageInterfaceRepositoryRepository.getDataById(id);
  }

  Future<void> updateData(StorageInterface data) async {
    await _storageInterfaceRepositoryRepository.updateData(data);
  }

  Future<StorageInterface?> postData(StorageInterface data) async {
    await _storageInterfaceRepositoryRepository.postData(data);

    return getDataById(data.id);
  }

  Future<void> delete(int id) async {
    await _storageInterfaceRepositoryRepository.deleteData(id);
  }
}
