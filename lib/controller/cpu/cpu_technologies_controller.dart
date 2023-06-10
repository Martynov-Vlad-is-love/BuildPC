import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/cpu/cpu_technologies.dart';
import 'package:buildpc/repository/cpu/cpu_technologies_repository.dart';

class CpuTechnologiesController
    implements ModelControllerAbstract<CPUTechnologies> {
  final CpuTechnologiesRepository _cpuTechnologiesRepository;

  CpuTechnologiesController(this._cpuTechnologiesRepository);

  @override
  Future<List<CPUTechnologies>> getList() async {
    return _cpuTechnologiesRepository.getAllData();
  }

  @override
  Future<CPUTechnologies?> getDataById(int? id) async {
    return _cpuTechnologiesRepository.getDataById(id);
  }

  @override
  Future<void> updateData(CPUTechnologies data) async {
    await _cpuTechnologiesRepository.updateData(data);
  }

  @override
  Future<CPUTechnologies?> postData(CPUTechnologies data) async {
    await _cpuTechnologiesRepository.postData(data);

    return getDataById(data.id);
  }

  @override
  Future<void> delete(int id) async {
    await _cpuTechnologiesRepository.deleteData(id);
  }
}
