import 'package:buildpc/model/gpu/gpu_memory_type.dart';
import 'package:buildpc/repository/gpu/gpu_memory_type_repository.dart';

class GpuMemoryTypeController {
  final GpuMemoryTypeRepository _gpuMemoryTypeRepository;

  GpuMemoryTypeController(this._gpuMemoryTypeRepository);

  Future<List<GPUMemoryType>> getList() async {
    return _gpuMemoryTypeRepository.getAllData();
  }

  Future<GPUMemoryType?> getDataById(int? id) async {
    return _gpuMemoryTypeRepository.getDataById(id);
  }

  Future<void> updateData(GPUMemoryType data) async {
    await _gpuMemoryTypeRepository.updateData(data);
  }

  Future<GPUMemoryType?> postData(GPUMemoryType data) async {
    await _gpuMemoryTypeRepository.postData(data);

    return getDataById(data.id);
  }

  Future<void> delete(int id) async {
    await _gpuMemoryTypeRepository.deleteData(id);
  }
}
