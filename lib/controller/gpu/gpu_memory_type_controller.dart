import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/gpu/gpu_memory_type.dart';
import 'package:buildpc/repository/gpu/gpu_memory_type_repository.dart';
import 'package:flutter/cupertino.dart';

class GpuMemoryTypeController extends ChangeNotifier
    implements ModelControllerAbstract<GPUMemoryType> {
  final GpuMemoryTypeRepository _gpuMemoryTypeRepository;

  GpuMemoryTypeController(this._gpuMemoryTypeRepository);

  @override
  Future<List<GPUMemoryType>> getList() async {
    final result = _gpuMemoryTypeRepository.getAllData();
    notifyListeners();

    return result;
  }

  @override
  Future<GPUMemoryType?> getDataById(int? id) async {
    final result = _gpuMemoryTypeRepository.getDataById(id);
    notifyListeners();

    return result;
  }

  @override
  Future<void> updateData(GPUMemoryType data) async {
    await _gpuMemoryTypeRepository.updateData(data);
    notifyListeners();
  }

  @override
  Future<void> postData(GPUMemoryType data) async {
    await _gpuMemoryTypeRepository.postData(data);
    notifyListeners();
  }

  @override
  Future<void> delete(int id) async {
    await _gpuMemoryTypeRepository.deleteData(id);
    notifyListeners();
  }
}
