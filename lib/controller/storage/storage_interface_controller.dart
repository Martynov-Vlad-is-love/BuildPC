import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/storage/storage_interface.dart';
import 'package:buildpc/repository/storage/storage_interface_repository.dart';

class StorageInterfaceController
    implements ModelControllerAbstract<StorageInterface> {
  final StorageInterfaceRepository _storageInterfaceRepositoryRepository;

  StorageInterfaceController(this._storageInterfaceRepositoryRepository);

  @override
  Future<List<StorageInterface>> getList() async {
    return _storageInterfaceRepositoryRepository.getAllData();
  }

  @override
  Future<StorageInterface?> getDataById(int? id) async {
    return _storageInterfaceRepositoryRepository.getDataById(id);
  }

  @override
  Future<void> updateData(StorageInterface data) async {
    await _storageInterfaceRepositoryRepository.updateData(data);
  }

  @override
  Future<StorageInterface?> postData(StorageInterface data) async {
    await _storageInterfaceRepositoryRepository.postData(data);

    return getDataById(data.id);
  }

  @override
  Future<void> delete(int id) async {
    await _storageInterfaceRepositoryRepository.deleteData(id);
  }
}
