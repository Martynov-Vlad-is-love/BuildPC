import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/gpu/gpu_connector.dart';
import 'package:buildpc/repository/gpu/gpu_connector_repository.dart';

class GpuConnectorController implements ModelControllerAbstract<GPUConnector>{
  final GpuConnectorRepository _gpuConnectorRepository;

  GpuConnectorController(this._gpuConnectorRepository);

  @override
  Future<List<GPUConnector>> getList() async {
    return _gpuConnectorRepository.getAllData();
  }

  @override
  Future<GPUConnector?> getDataById(int? id) async {
    return _gpuConnectorRepository.getDataById(id);
  }

  @override
  Future<void> updateData(GPUConnector data) async {
    await _gpuConnectorRepository.updateData(data);
  }

  @override
  Future<GPUConnector?> postData(GPUConnector data) async {
    await _gpuConnectorRepository.postData(data);

    return getDataById(data.id);
  }

  @override
  Future<void> delete(int id) async {
    await _gpuConnectorRepository.deleteData(id);
  }
}
