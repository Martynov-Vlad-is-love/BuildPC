import 'package:buildpc/model/general/performance_level.dart';
import 'package:buildpc/repository/general/performance_level_repository.dart';

class PerformanceLevelController {
  final PerformanceLevelRepository _performanceLevelRepository;

  PerformanceLevelController(this._performanceLevelRepository);

  Future<List<PerformanceLevel>> getList() async {
    return _performanceLevelRepository.getAllData();
  }

  Future<PerformanceLevel?> getDataById(int? id) async {
    return _performanceLevelRepository.getDataById(id);
  }

  Future<void> updateData(PerformanceLevel data) async {
    await _performanceLevelRepository.updateData(data);
  }

  Future<PerformanceLevel?> postData(PerformanceLevel data) async {
    await _performanceLevelRepository.postData(data);

    return getDataById(data.id);
  }

  Future<void> delete(int id) async {
    await _performanceLevelRepository.deleteData(id);
  }
}
