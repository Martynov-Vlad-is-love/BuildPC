import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/ram/ram_timings.dart';
import 'package:buildpc/repository/ram/ram_timings_repository.dart';

class RamTimingsController implements ModelControllerAbstract<RamTimings>{
  final RamTimingsRepository _ramTimingsRepository;

  RamTimingsController(this._ramTimingsRepository);

  @override
  Future<List<RamTimings>> getList() async {
    return _ramTimingsRepository.getAllData();
  }

  @override
  Future<RamTimings?> getDataById(int? id) async {
    return _ramTimingsRepository.getDataById(id);
  }

  @override
  Future<void> updateData(RamTimings data) async {
    await _ramTimingsRepository.updateData(data);
  }

  @override
  Future<RamTimings?> postData(RamTimings data) async {
    await _ramTimingsRepository.postData(data);

    return getDataById(data.id);
  }

  @override
  Future<void> delete(int id) async {
    await _ramTimingsRepository.deleteData(id);
  }
}
