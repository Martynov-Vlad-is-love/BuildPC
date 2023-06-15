import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/ram/ram_memory_type.dart';
import 'package:buildpc/repository/ram/ram_memory_type_repository.dart';
import 'package:flutter/cupertino.dart';

class RamMemoryTypeController extends ChangeNotifier
    implements ModelControllerAbstract<RamMemoryType> {
  final RamMemoryTypeRepository _ramMemoryTypeRepository;

  RamMemoryTypeController(this._ramMemoryTypeRepository);

  @override
  Future<List<RamMemoryType>> getList() async {
    final result = _ramMemoryTypeRepository.getAllData();
    notifyListeners();

    return result;
  }

  @override
  Future<RamMemoryType?> getDataById(int? id) async {
    final result = _ramMemoryTypeRepository.getDataById(id);
    notifyListeners();

    return result;
  }

  @override
  Future<void> updateData(RamMemoryType data) async {
    await _ramMemoryTypeRepository.updateData(data);
    notifyListeners();
  }

  @override
  Future<void> postData(RamMemoryType data) async {
    await _ramMemoryTypeRepository.postData(data);
    notifyListeners();
  }

  @override
  Future<void> delete(int id) async {
    await _ramMemoryTypeRepository.deleteData(id);
    notifyListeners();
  }
}
