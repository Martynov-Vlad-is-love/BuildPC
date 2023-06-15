import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/power/power_supply_protection_functions.dart';
import 'package:buildpc/repository/power/power_supply_protection_functions_repository.dart';
import 'package:flutter/cupertino.dart';

class PowerSupplyProtectionFunctionsController extends ChangeNotifier
    implements ModelControllerAbstract<PowerSupplyProtectionFunctions> {
  final PowerSupplyProtectionFunctionsRepository _powerSupplyPFRepository;

  PowerSupplyProtectionFunctionsController(this._powerSupplyPFRepository);

  @override
  Future<List<PowerSupplyProtectionFunctions>> getList() async {
    final result = _powerSupplyPFRepository.getAllData();
    notifyListeners();

    return result;
  }

  @override
  Future<PowerSupplyProtectionFunctions?> getDataById(int? id) async {
    final result = _powerSupplyPFRepository.getDataById(id);
    notifyListeners();

    return result;
  }

  @override
  Future<void> updateData(PowerSupplyProtectionFunctions data) async {
    await _powerSupplyPFRepository.updateData(data);
    notifyListeners();
  }

  @override
  Future<void> postData(PowerSupplyProtectionFunctions data) async {
    await _powerSupplyPFRepository.postData(data);
    notifyListeners();
  }

  @override
  Future<void> delete(int id) async {
    await _powerSupplyPFRepository.deleteData(id);
    notifyListeners();
  }
}
