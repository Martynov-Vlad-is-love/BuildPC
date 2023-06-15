import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/cpu/cpu_technologies.dart';
import 'package:buildpc/repository/cpu/cpu_technologies_repository.dart';
import 'package:flutter/cupertino.dart';

class CpuTechnologiesController extends ChangeNotifier
    implements ModelControllerAbstract<CPUTechnologies> {
  final CpuTechnologiesRepository _cpuTechnologiesRepository;

  CpuTechnologiesController(this._cpuTechnologiesRepository);

  @override
  Future<List<CPUTechnologies>> getList() async {
    final result = _cpuTechnologiesRepository.getAllData();
    notifyListeners();

    return result;
  }

  @override
  Future<CPUTechnologies?> getDataById(int? id) async {
    final result = _cpuTechnologiesRepository.getDataById(id);
    notifyListeners();

    return result;
  }

  @override
  Future<void> updateData(CPUTechnologies data) async {
    await _cpuTechnologiesRepository.updateData(data);
    notifyListeners();
  }

  @override
  Future<void> postData(CPUTechnologies data) async {
    await _cpuTechnologiesRepository.postData(data);
    notifyListeners();
  }

  @override
  Future<void> delete(int id) async {
    await _cpuTechnologiesRepository.deleteData(id);
    notifyListeners();
  }
}
