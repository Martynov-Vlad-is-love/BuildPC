import 'package:buildpc/model/cpu/cpu_generation.dart';
import 'package:buildpc/repository/cpu/cpu_generation_repository.dart';

class CpuGenerationController{
  final CpuGenerationRepository _cpuGenerationRepository;
  CpuGenerationController(this._cpuGenerationRepository);

  Future<List<CPUGeneration>> getList() async{
    return _cpuGenerationRepository.getAllData();
  }

  Future<CPUGeneration?> getDataById(int? id) async{
    return _cpuGenerationRepository.getDataById(id);
  }

  Future<void> updateData(CPUGeneration data) async{
    await _cpuGenerationRepository.updateData(data);
  }

  Future<CPUGeneration?> postData(CPUGeneration data) async{
    await _cpuGenerationRepository.postData(data);

    return getDataById(data.id);
  }

  Future<void> delete(int id) async{
    await _cpuGenerationRepository.deleteData(id);
  }
}
