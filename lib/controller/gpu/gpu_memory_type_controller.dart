import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/gpu/gpu_memory_type.dart';
import 'package:buildpc/repository/gpu/gpu_memory_type_repository.dart';

class GpuMemoryTypeController implements ModelControllerAbstract<GPUMemoryType>{
  final GpuMemoryTypeRepository _gpuMemoryTypeRepository;

  GpuMemoryTypeController(this._gpuMemoryTypeRepository);

  @override
  Future<List<GPUMemoryType>> getList() async {
    return _gpuMemoryTypeRepository.getAllData();
  }

  @override
  Future<GPUMemoryType?> getDataById(int? id) async {
    return _gpuMemoryTypeRepository.getDataById(id);
  }

  @override
  Future<void> updateData(GPUMemoryType data) async {
    await _gpuMemoryTypeRepository.updateData(data);
  }

  @override
  Future<GPUMemoryType?> postData(GPUMemoryType data) async {
    await _gpuMemoryTypeRepository.postData(data);

    return getDataById(data.id);
  }

  @override
  Future<void> delete(int id) async {
    await _gpuMemoryTypeRepository.deleteData(id);
  }
}
