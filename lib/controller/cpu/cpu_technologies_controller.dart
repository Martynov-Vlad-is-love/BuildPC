import 'package:buildpc/model/cpu/cpu_technologies.dart';
import 'package:buildpc/repository/cpu/cpu_technologies_repository.dart';

class CpuTechnologiesController{
  final CpuTechnologiesRepository _cpuTechnologiesRepository;
  CpuTechnologiesController(this._cpuTechnologiesRepository);

  Future<List<CPUTechnologies>> getList() async{
    return _cpuTechnologiesRepository.getAllData();
  }

  Future<CPUTechnologies?> getDataById(int? id) async{
    return _cpuTechnologiesRepository.getDataById(id);
  }

  Future<void> updateData(CPUTechnologies data) async{
    await _cpuTechnologiesRepository.updateData(data);
  }

  Future<CPUTechnologies?> postData(CPUTechnologies data) async{
    await _cpuTechnologiesRepository.postData(data);

    return getDataById(data.id);
  }

  Future<void> delete(int id) async{
    await _cpuTechnologiesRepository.deleteData(id);
  }
}
