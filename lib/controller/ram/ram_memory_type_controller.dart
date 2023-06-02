import 'package:buildpc/model/ram/ram_memory_type.dart';
import 'package:buildpc/repository/ram/ram_memory_type_repository.dart';

class RamMemoryTypeController {
  final RamMemoryTypeRepository _ramMemoryTypeRepository;

  RamMemoryTypeController(this._ramMemoryTypeRepository);

  Future<List<RamMemoryType>> getList() async {
    return _ramMemoryTypeRepository.getAllData();
  }

  Future<RamMemoryType?> getDataById(int? id) async {
    return _ramMemoryTypeRepository.getDataById(id);
  }

  Future<void> updateData(RamMemoryType data) async {
    await _ramMemoryTypeRepository.updateData(data);
  }

  Future<RamMemoryType?> postData(RamMemoryType data) async {
    await _ramMemoryTypeRepository.postData(data);

    return getDataById(data.id);
  }

  Future<void> delete(int id) async {
    await _ramMemoryTypeRepository.deleteData(id);
  }
}
