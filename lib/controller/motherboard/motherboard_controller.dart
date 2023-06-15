import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/motherboard/motherboard.dart';
import 'package:buildpc/repository/motherboard/motherboard_repository.dart';
import 'package:flutter/cupertino.dart';

class MotherboardController extends ChangeNotifier
    implements ModelControllerAbstract<Motherboard> {
  final MotherboardRepository _motherboardRepository;

  MotherboardController(this._motherboardRepository);

  @override
  Future<List<Motherboard>> getList() async {
    final result = _motherboardRepository.getAllData();
    notifyListeners();

    return result;
  }

  @override
  Future<Motherboard?> getDataById(int? id) async {
    final result = _motherboardRepository.getDataById(id);
    notifyListeners();

    return result;
  }

  @override
  Future<void> updateData(Motherboard data) async {
    await _motherboardRepository.updateData(data);
    notifyListeners();
  }

  @override
  Future<void> postData(Motherboard data) async {
    await _motherboardRepository.postData(data);
    notifyListeners();
  }

  @override
  Future<void> delete(int id) async {
    await _motherboardRepository.deleteData(id);
    notifyListeners();
  }
}
