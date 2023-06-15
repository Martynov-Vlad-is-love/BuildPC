import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/gpu/gpu_interface_type.dart';
import 'package:buildpc/repository/gpu/gpu_interface_type_repository.dart';
import 'package:flutter/cupertino.dart';

class GpuInterfaceTypeController extends ChangeNotifier
    implements ModelControllerAbstract<GPUInterfaceType> {
  final GpuInterfaceTypeRepository _gpuInterfaceTypeRepository;

  GpuInterfaceTypeController(this._gpuInterfaceTypeRepository);

  @override
  Future<List<GPUInterfaceType>> getList() async {
    final result = _gpuInterfaceTypeRepository.getAllData();
    notifyListeners();

    return result;
  }

  @override
  Future<GPUInterfaceType?> getDataById(int? id) async {
    final result = _gpuInterfaceTypeRepository.getDataById(id);
    notifyListeners();

    return result;
  }

  @override
  Future<void> updateData(GPUInterfaceType data) async {
    await _gpuInterfaceTypeRepository.updateData(data);
    notifyListeners();
  }

  @override
  Future<void> postData(GPUInterfaceType data) async {
    await _gpuInterfaceTypeRepository.postData(data);
    notifyListeners();
  }

  @override
  Future<void> delete(int id) async {
    await _gpuInterfaceTypeRepository.deleteData(id);
    notifyListeners();
  }
}
