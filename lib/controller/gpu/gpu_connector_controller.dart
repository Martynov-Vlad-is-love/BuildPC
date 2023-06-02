import 'package:buildpc/model/gpu/gpu_connector.dart';
import 'package:buildpc/repository/gpu/gpu_connector_repository.dart';

class GpuConnectorController {
  final GpuConnectorRepository _gpuConnectorRepository;

  GpuConnectorController(this._gpuConnectorRepository);

  Future<List<GPUConnector>> getList() async {
    return _gpuConnectorRepository.getAllData();
  }

  Future<GPUConnector?> getDataById(int? id) async {
    return _gpuConnectorRepository.getDataById(id);
  }

  Future<void> updateData(GPUConnector data) async {
    await _gpuConnectorRepository.updateData(data);
  }

  Future<GPUConnector?> postData(GPUConnector data) async {
    await _gpuConnectorRepository.postData(data);

    return getDataById(data.id);
  }

  Future<void> delete(int id) async {
    await _gpuConnectorRepository.deleteData(id);
  }
}
