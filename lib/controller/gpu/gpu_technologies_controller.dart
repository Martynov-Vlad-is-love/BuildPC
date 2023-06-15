import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/gpu/gpu_technologies.dart';
import 'package:buildpc/repository/gpu/gpu_technologies_repository.dart';
import 'package:flutter/cupertino.dart';

class GpuTechnologiesController extends ChangeNotifier
    implements ModelControllerAbstract<GPUTechnologies> {
  final GpuTechnologiesRepository _gpuTechnologiesRepository;

  GpuTechnologiesController(this._gpuTechnologiesRepository);

  @override
  Future<List<GPUTechnologies>> getList() async {
    final result = _gpuTechnologiesRepository.getAllData();
    notifyListeners();

    return result;
  }

  @override
  Future<GPUTechnologies?> getDataById(int? id) async {
    final result = _gpuTechnologiesRepository.getDataById(id);
    notifyListeners();

    return result;
  }

  @override
  Future<void> updateData(GPUTechnologies data) async {
    await _gpuTechnologiesRepository.updateData(data);
    notifyListeners();
  }

  @override
  Future<void> postData(GPUTechnologies data) async {
    await _gpuTechnologiesRepository.postData(data);
    notifyListeners();
  }

  @override
  Future<void> delete(int id) async {
    await _gpuTechnologiesRepository.deleteData(id);
    notifyListeners();
  }
}
