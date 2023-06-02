import 'package:buildpc/model/power/power_supply_protection_functions.dart';
import 'package:buildpc/repository/power/power_supply_protection_functions_repository.dart';

class PowerSupplyProtectionFunctionsController {
  final PowerSupplyProtectionFunctionsRepository _powerSupplyPFRepository;

  PowerSupplyProtectionFunctionsController(this._powerSupplyPFRepository);

  Future<List<PowerSupplyProtectionFunctions>> getList() async {
    return _powerSupplyPFRepository.getAllData();
  }

  Future<PowerSupplyProtectionFunctions?> getDataById(int? id) async {
    return _powerSupplyPFRepository.getDataById(id);
  }

  Future<void> updateData(PowerSupplyProtectionFunctions data) async {
    await _powerSupplyPFRepository.updateData(data);
  }

  Future<PowerSupplyProtectionFunctions?> postData(
    PowerSupplyProtectionFunctions data,) async {
    await _powerSupplyPFRepository.postData(data);

    return getDataById(data.id);
  }

  Future<void> delete(int id) async {
    await _powerSupplyPFRepository.deleteData(id);
  }
}
