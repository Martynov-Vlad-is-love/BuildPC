import 'package:buildpc/model/ram/ram_timings.dart';
import 'package:buildpc/repository/ram/ram_timings_repository.dart';

class RamTimingsController {
  final RamTimingsRepository _ramTimingsRepository;

  RamTimingsController(this._ramTimingsRepository);

  Future<List<RamTimings>> getList() async {
    return _ramTimingsRepository.getAllData();
  }

  Future<RamTimings?> getDataById(int? id) async {
    return _ramTimingsRepository.getDataById(id);
  }

  Future<void> updateData(RamTimings data) async {
    await _ramTimingsRepository.updateData(data);
  }

  Future<RamTimings?> postData(RamTimings data) async {
    await _ramTimingsRepository.postData(data);

    return getDataById(data.id);
  }

  Future<void> delete(int id) async {
    await _ramTimingsRepository.deleteData(id);
  }
}
