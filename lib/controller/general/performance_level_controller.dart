import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/general/performance_level.dart';
import 'package:buildpc/repository/general/performance_level_repository.dart';
import 'package:flutter/material.dart';

class PerformanceLevelController extends ChangeNotifier
    implements ModelControllerAbstract<PerformanceLevel> {
  final PerformanceLevelRepository _performanceLevelRepository;

  PerformanceLevelController(this._performanceLevelRepository);

  @override
  Future<List<PerformanceLevel>> getList() async {
    final data = _performanceLevelRepository.getAllData();
    notifyListeners();

    return data;
  }

  @override
  Future<PerformanceLevel?> getDataById(int? id) async {
    final data = _performanceLevelRepository.getDataById(id);
    notifyListeners();

    return data;
  }

  @override
  Future<void> updateData(PerformanceLevel data) async {
    await _performanceLevelRepository.updateData(data);
    notifyListeners();
  }

  @override
  Future<void> postData(PerformanceLevel data) async {
    await _performanceLevelRepository.postData(data);
    notifyListeners();
  }

  @override
  Future<void> delete(int id) async {
    await _performanceLevelRepository.deleteData(id);
    notifyListeners();
  }
}
