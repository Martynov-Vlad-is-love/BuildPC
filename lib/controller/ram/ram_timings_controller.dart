import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/ram/ram_timings.dart';
import 'package:buildpc/repository/ram/ram_timings_repository.dart';
import 'package:flutter/cupertino.dart';

class RamTimingsController extends ChangeNotifier
    implements ModelControllerAbstract<RamTimings> {
  final RamTimingsRepository _ramTimingsRepository;

  RamTimingsController(this._ramTimingsRepository);

  @override
  Future<List<RamTimings>> getList() async {
    final result = _ramTimingsRepository.getAllData();
    notifyListeners();

    return result;
  }

  @override
  Future<RamTimings?> getDataById(int? id) async {
    final result = _ramTimingsRepository.getDataById(id);
    notifyListeners();

    return result;
  }

  @override
  Future<void> updateData(RamTimings data) async {
    await _ramTimingsRepository.updateData(data);
    notifyListeners();
  }

  @override
  Future<void> postData(RamTimings data) async {
    await _ramTimingsRepository.postData(data);
    notifyListeners();
  }

  @override
  Future<void> delete(int id) async {
    await _ramTimingsRepository.deleteData(id);
    notifyListeners();
  }
}
