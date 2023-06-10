import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/gpu/gpu_interface_type.dart';
import 'package:buildpc/repository/gpu/gpu_interface_type_repository.dart';

class GpuInterfaceTypeController
    implements ModelControllerAbstract<GPUInterfaceType> {
  final GpuInterfaceTypeRepository _gpuInterfaceTypeRepository;

  GpuInterfaceTypeController(this._gpuInterfaceTypeRepository);

  @override
  Future<List<GPUInterfaceType>> getList() async {
    return _gpuInterfaceTypeRepository.getAllData();
  }

  @override
  Future<GPUInterfaceType?> getDataById(int? id) async {
    return _gpuInterfaceTypeRepository.getDataById(id);
  }

  @override
  Future<void> updateData(GPUInterfaceType data) async {
    await _gpuInterfaceTypeRepository.updateData(data);
  }

  @override
  Future<GPUInterfaceType?> postData(GPUInterfaceType data) async {
    await _gpuInterfaceTypeRepository.postData(data);

    return getDataById(data.id);
  }

  @override
  Future<void> delete(int id) async {
    await _gpuInterfaceTypeRepository.deleteData(id);
  }
}
