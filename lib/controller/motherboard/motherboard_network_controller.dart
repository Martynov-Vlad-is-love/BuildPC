import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/motherboard/motherboard_network.dart';
import 'package:buildpc/repository/motherboard/motherboard_network_repository.dart';
import 'package:flutter/cupertino.dart';

class MotherboardNetworkController extends ChangeNotifier
    implements ModelControllerAbstract<MotherboardNetwork> {
  final MotherboardNetworkRepository _motherboardNetworkRepository;

  MotherboardNetworkController(this._motherboardNetworkRepository);

  @override
  Future<List<MotherboardNetwork>> getList() async {
    final result = _motherboardNetworkRepository.getAllData();
    notifyListeners();

    return result;
  }

  @override
  Future<MotherboardNetwork?> getDataById(int? id) async {
    final result = _motherboardNetworkRepository.getDataById(id);
    notifyListeners();

    return result;
  }

  @override
  Future<void> updateData(MotherboardNetwork data) async {
    await _motherboardNetworkRepository.updateData(data);
    notifyListeners();
  }

  @override
  Future<void> postData(MotherboardNetwork data) async {
    await _motherboardNetworkRepository.postData(data);
    notifyListeners();
  }

  @override
  Future<void> delete(int id) async {
    await _motherboardNetworkRepository.deleteData(id);
    notifyListeners();
  }
}
