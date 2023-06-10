import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/gpu/gpu_technologies.dart';
import 'package:buildpc/repository/gpu/gpu_technologies_repository.dart';

class GpuTechnologiesController
    implements ModelControllerAbstract<GPUTechnologies> {
  final GpuTechnologiesRepository _gpuTechnologiesRepository;

  GpuTechnologiesController(this._gpuTechnologiesRepository);

  @override
  Future<List<GPUTechnologies>> getList() async {
    return _gpuTechnologiesRepository.getAllData();
  }

  @override
  Future<GPUTechnologies?> getDataById(int? id) async {
    return _gpuTechnologiesRepository.getDataById(id);
  }

  @override
  Future<void> updateData(GPUTechnologies data) async {
    await _gpuTechnologiesRepository.updateData(data);
  }

  @override
  Future<GPUTechnologies?> postData(GPUTechnologies data) async {
    await _gpuTechnologiesRepository.postData(data);

    return getDataById(data.id);
  }

  @override
  Future<void> delete(int id) async {
    await _gpuTechnologiesRepository.deleteData(id);
  }
}
