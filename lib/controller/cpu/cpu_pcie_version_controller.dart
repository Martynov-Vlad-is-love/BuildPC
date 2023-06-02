import 'package:buildpc/model/cpu/cpu_pcie_version.dart';
import 'package:buildpc/repository/cpu/cpu_pcie_version_repository.dart';

class CpuPcieVersionController{
  final CpuPcieVersionRepository _cpuPcieVersionRepository;
  CpuPcieVersionController(this._cpuPcieVersionRepository);

  Future<List<CPUPCIeVersion>> getList() async{
    return _cpuPcieVersionRepository.getAllData();
  }

  Future<CPUPCIeVersion?> getDataById(int? id) async{
    return _cpuPcieVersionRepository.getDataById(id);
  }

  Future<void> updateData(CPUPCIeVersion data) async{
    await _cpuPcieVersionRepository.updateData(data);
  }

  Future<CPUPCIeVersion?> postData(CPUPCIeVersion data) async{
    await _cpuPcieVersionRepository.postData(data);

    return getDataById(data.id);
  }

  Future<void> delete(int id) async{
    await _cpuPcieVersionRepository.deleteData(id);
  }
}
