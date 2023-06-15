import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/storage/hdd.dart';
import 'package:buildpc/repository/storage/hdd_repository.dart';
import 'package:flutter/cupertino.dart';

class HddController extends ChangeNotifier
    implements ModelControllerAbstract<Hdd> {
  final HddRepository _hddRepository;

  HddController(this._hddRepository);

  @override
  Future<List<Hdd>> getList() async {
    final result = _hddRepository.getAllData();
    notifyListeners();

    return result;
  }

  @override
  Future<Hdd?> getDataById(int? id) async {
    final result = _hddRepository.getDataById(id);
    notifyListeners();

    return result;
  }

  @override
  Future<void> updateData(Hdd data) async {
    await _hddRepository.updateData(data);
    notifyListeners();
  }

  @override
  Future<void> postData(Hdd data) async {
    await _hddRepository.postData(data);
    notifyListeners();
  }

  @override
  Future<void> delete(int id) async {
    await _hddRepository.deleteData(id);
    notifyListeners();
  }
}
