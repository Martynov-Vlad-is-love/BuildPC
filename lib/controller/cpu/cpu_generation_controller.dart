import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/cpu/cpu_generation.dart';
import 'package:buildpc/repository/cpu/cpu_generation_repository.dart';
import 'package:flutter/cupertino.dart';

class CpuGenerationController extends ChangeNotifier
    implements ModelControllerAbstract<CPUGeneration> {
  final CpuGenerationRepository _cpuGenerationRepository;

  CpuGenerationController(this._cpuGenerationRepository);

  @override
  Future<List<CPUGeneration>> getList() async {
    final result = _cpuGenerationRepository.getAllData();
    notifyListeners();

    return result;
  }

  @override
  Future<CPUGeneration?> getDataById(int? id) async {
    final result = _cpuGenerationRepository.getDataById(id);
    notifyListeners();

    return result;
  }

  @override
  Future<void> updateData(CPUGeneration data) async {
    await _cpuGenerationRepository.updateData(data);
    notifyListeners();
  }

  @override
  Future<void> postData(CPUGeneration data) async {
    await _cpuGenerationRepository.postData(data);
    notifyListeners();
  }

  @override
  Future<void> delete(int id) async {
    await _cpuGenerationRepository.deleteData(id);
    notifyListeners();
  }
}
