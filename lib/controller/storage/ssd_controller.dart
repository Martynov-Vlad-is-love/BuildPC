import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/storage/ssd.dart';
import 'package:buildpc/repository/storage/ssd_repository.dart';
import 'package:flutter/cupertino.dart';

class SsdController extends ChangeNotifier
    implements ModelControllerAbstract<Ssd> {
  final SsdRepository _ssdRepository;

  SsdController(this._ssdRepository);

  @override
  Future<List<Ssd>> getList() async {
    final result = _ssdRepository.getAllData();
    notifyListeners();

    return result;
  }

  @override
  Future<Ssd?> getDataById(int? id) async {
    final result = _ssdRepository.getDataById(id);
    notifyListeners();

    return result;
  }

  @override
  Future<void> updateData(Ssd data) async {
    await _ssdRepository.updateData(data);
    notifyListeners();
  }

  @override
  Future<void> postData(Ssd data) async {
    await _ssdRepository.postData(data);
    notifyListeners();
  }

  @override
  Future<void> delete(int id) async {
    await _ssdRepository.deleteData(id);
    notifyListeners();
  }
}
