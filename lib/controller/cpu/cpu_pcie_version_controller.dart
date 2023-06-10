import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/cpu/cpu_pcie_version.dart';
import 'package:buildpc/repository/cpu/cpu_pcie_version_repository.dart';

class CpuPcieVersionController
    implements ModelControllerAbstract<CPUPCIeVersion> {
  final CpuPcieVersionRepository _cpuPcieVersionRepository;

  CpuPcieVersionController(this._cpuPcieVersionRepository);

  @override
  Future<List<CPUPCIeVersion>> getList() async {
    return _cpuPcieVersionRepository.getAllData();
  }

  @override
  Future<CPUPCIeVersion?> getDataById(int? id) async {
    return _cpuPcieVersionRepository.getDataById(id);
  }

  @override
  Future<void> updateData(CPUPCIeVersion data) async {
    await _cpuPcieVersionRepository.updateData(data);
  }

  @override
  Future<CPUPCIeVersion?> postData(CPUPCIeVersion data) async {
    await _cpuPcieVersionRepository.postData(data);

    return getDataById(data.id);
  }

  @override
  Future<void> delete(int id) async {
    await _cpuPcieVersionRepository.deleteData(id);
  }
}
