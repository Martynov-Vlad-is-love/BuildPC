import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/gpu/gpu_connector.dart';
import 'package:buildpc/repository/gpu/gpu_connector_repository.dart';
import 'package:flutter/cupertino.dart';

class GpuConnectorController extends ChangeNotifier
    implements ModelControllerAbstract<GPUConnector> {
  final GpuConnectorRepository _gpuConnectorRepository;

  GpuConnectorController(this._gpuConnectorRepository);

  @override
  Future<List<GPUConnector>> getList() async {
    final result = _gpuConnectorRepository.getAllData();
    notifyListeners();

    return result;
  }

  @override
  Future<GPUConnector?> getDataById(int? id) async {
    final result = _gpuConnectorRepository.getDataById(id);
    notifyListeners();

    return result;
  }

  @override
  Future<void> updateData(GPUConnector data) async {
    await _gpuConnectorRepository.updateData(data);
    notifyListeners();
  }

  @override
  Future<void> postData(GPUConnector data) async {
    await _gpuConnectorRepository.postData(data);
    notifyListeners();
  }

  @override
  Future<void> delete(int id) async {
    await _gpuConnectorRepository.deleteData(id);
    notifyListeners();
  }
}
