import 'package:buildpc/model/gpu/gpu_interface_type.dart';
import 'package:buildpc/repository/gpu/gpu_interface_type_repository.dart';

class GpuInterfaceTypeController {
  final GpuInterfaceTypeRepository _gpuInterfaceTypeRepository;

  GpuInterfaceTypeController(this._gpuInterfaceTypeRepository);

  Future<List<GPUInterfaceType>> getList() async {
    return _gpuInterfaceTypeRepository.getAllData();
  }

  Future<GPUInterfaceType?> getDataById(int? id) async {
    return _gpuInterfaceTypeRepository.getDataById(id);
  }

  Future<void> updateData(GPUInterfaceType data) async {
    await _gpuInterfaceTypeRepository.updateData(data);
  }

  Future<GPUInterfaceType?> postData(GPUInterfaceType data) async {
    await _gpuInterfaceTypeRepository.postData(data);

    return getDataById(data.id);
  }

  Future<void> delete(int id) async {
    await _gpuInterfaceTypeRepository.deleteData(id);
  }
}
