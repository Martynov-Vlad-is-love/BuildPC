import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/power/power_supply.dart';
import 'package:buildpc/repository/power/power_supply_repository.dart';
import 'package:flutter/cupertino.dart';

class PowerSupplyController extends ChangeNotifier
    implements ModelControllerAbstract<PowerSupply> {
  final PowerSupplyRepository _powerSupplyRepository;

  PowerSupplyController(this._powerSupplyRepository);

  @override
  Future<List<PowerSupply>> getList() async {
    final result = _powerSupplyRepository.getAllData();
    notifyListeners();

    return result;
  }

  @override
  Future<PowerSupply?> getDataById(int? id) async {
    final result = _powerSupplyRepository.getDataById(id);
    notifyListeners();

    return result;
  }

  @override
  Future<void> updateData(PowerSupply data) async {
    await _powerSupplyRepository.updateData(data);
    notifyListeners();
  }

  @override
  Future<void> postData(PowerSupply data) async {
    await _powerSupplyRepository.postData(data);
    notifyListeners();
  }

  @override
  Future<void> delete(int id) async {
    await _powerSupplyRepository.deleteData(id);
    notifyListeners();
  }
}
