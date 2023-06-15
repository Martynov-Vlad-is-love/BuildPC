import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/cpu/cpu_pcie_version.dart';
import 'package:buildpc/repository/cpu/cpu_pcie_version_repository.dart';
import 'package:flutter/cupertino.dart';

class CpuPcieVersionController extends ChangeNotifier
    implements ModelControllerAbstract<CPUPCIeVersion> {
  final CpuPcieVersionRepository _cpuPcieVersionRepository;

  CpuPcieVersionController(this._cpuPcieVersionRepository);

  @override
  Future<List<CPUPCIeVersion>> getList() async {
    final result = _cpuPcieVersionRepository.getAllData();
    notifyListeners();

    return result;
  }

  @override
  Future<CPUPCIeVersion?> getDataById(int? id) async {
    final result = _cpuPcieVersionRepository.getDataById(id);
    notifyListeners();

    return result;
  }

  @override
  Future<void> updateData(CPUPCIeVersion data) async {
    await _cpuPcieVersionRepository.updateData(data);
    notifyListeners();
  }

  @override
  Future<void> postData(CPUPCIeVersion data) async {
    await _cpuPcieVersionRepository.postData(data);
    notifyListeners();
  }

  @override
  Future<void> delete(int id) async {
    await _cpuPcieVersionRepository.deleteData(id);
    notifyListeners();
  }
}
