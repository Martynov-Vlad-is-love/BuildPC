import 'package:buildpc/model/gpu/gpu_technologies.dart';
import 'package:buildpc/repository/gpu/gpu_technologies_repository.dart';

class GpuTechnologiesController {
  final GpuTechnologiesRepository _gpuTechnologiesRepository;

  GpuTechnologiesController(this._gpuTechnologiesRepository);

  Future<List<GPUTechnologies>> getList() async {
    return _gpuTechnologiesRepository.getAllData();
  }

  Future<GPUTechnologies?> getDataById(int? id) async {
    return _gpuTechnologiesRepository.getDataById(id);
  }

  Future<void> updateData(GPUTechnologies data) async {
    await _gpuTechnologiesRepository.updateData(data);
  }

  Future<GPUTechnologies?> postData(GPUTechnologies data) async {
    await _gpuTechnologiesRepository.postData(data);

    return getDataById(data.id);
  }

  Future<void> delete(int id) async {
    await _gpuTechnologiesRepository.deleteData(id);
  }
}
