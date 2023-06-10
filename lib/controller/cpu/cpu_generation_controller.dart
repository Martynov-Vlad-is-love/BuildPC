import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/cpu/cpu_generation.dart';
import 'package:buildpc/repository/cpu/cpu_generation_repository.dart';

class CpuGenerationController implements ModelControllerAbstract<CPUGeneration>{
  final CpuGenerationRepository _cpuGenerationRepository;
  CpuGenerationController(this._cpuGenerationRepository);

  @override
  Future<List<CPUGeneration>> getList() async{
    return _cpuGenerationRepository.getAllData();
  }

  @override
  Future<CPUGeneration?> getDataById(int? id) async{
    return _cpuGenerationRepository.getDataById(id);
  }

  @override
  Future<void> updateData(CPUGeneration data) async{
    await _cpuGenerationRepository.updateData(data);
  }

  @override
  Future<CPUGeneration?> postData(CPUGeneration data) async{
    await _cpuGenerationRepository.postData(data);

    return getDataById(data.id);
  }

  @override
  Future<void> delete(int id) async{
    await _cpuGenerationRepository.deleteData(id);
  }
}
