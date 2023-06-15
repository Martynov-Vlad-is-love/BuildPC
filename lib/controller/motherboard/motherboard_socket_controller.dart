import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/motherboard/motherboard_socket.dart';
import 'package:buildpc/repository/motherboard/motherboard_socket_repository.dart';
import 'package:flutter/cupertino.dart';

class MotherboardSocketController extends ChangeNotifier
    implements ModelControllerAbstract<MotherboardSocket> {
  final MotherboardSocketRepository _motherboardSocketRepository;

  MotherboardSocketController(this._motherboardSocketRepository);

  @override
  Future<List<MotherboardSocket>> getList() async {
    final result = _motherboardSocketRepository.getAllData();
    notifyListeners();

    return result;
  }

  @override
  Future<MotherboardSocket?> getDataById(int? id) async {
    final result = _motherboardSocketRepository.getDataById(id);
    notifyListeners();

    return result;
  }

  @override
  Future<void> updateData(MotherboardSocket data) async {
    await _motherboardSocketRepository.updateData(data);
    notifyListeners();
  }

  @override
  Future<void> postData(MotherboardSocket data) async {
    await _motherboardSocketRepository.postData(data);
    notifyListeners();
  }

  @override
  Future<void> delete(int id) async {
    await _motherboardSocketRepository.deleteData(id);
    notifyListeners();
  }
}
