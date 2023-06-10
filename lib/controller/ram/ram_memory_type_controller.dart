import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/ram/ram_memory_type.dart';
import 'package:buildpc/repository/ram/ram_memory_type_repository.dart';

class RamMemoryTypeController implements ModelControllerAbstract<RamMemoryType>{
  final RamMemoryTypeRepository _ramMemoryTypeRepository;

  RamMemoryTypeController(this._ramMemoryTypeRepository);

  @override
  Future<List<RamMemoryType>> getList() async {
    return _ramMemoryTypeRepository.getAllData();
  }

  @override
  Future<RamMemoryType?> getDataById(int? id) async {
    return _ramMemoryTypeRepository.getDataById(id);
  }

  @override
  Future<void> updateData(RamMemoryType data) async {
    await _ramMemoryTypeRepository.updateData(data);
  }

  @override
  Future<RamMemoryType?> postData(RamMemoryType data) async {
    await _ramMemoryTypeRepository.postData(data);

    return getDataById(data.id);
  }

  @override
  Future<void> delete(int id) async {
    await _ramMemoryTypeRepository.deleteData(id);
  }
}
