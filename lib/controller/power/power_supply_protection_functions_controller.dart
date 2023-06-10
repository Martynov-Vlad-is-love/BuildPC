import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/power/power_supply_protection_functions.dart';
import 'package:buildpc/repository/power/power_supply_protection_functions_repository.dart';

class PowerSupplyProtectionFunctionsController
    implements ModelControllerAbstract<PowerSupplyProtectionFunctions> {
  final PowerSupplyProtectionFunctionsRepository _powerSupplyPFRepository;

  PowerSupplyProtectionFunctionsController(this._powerSupplyPFRepository);

  @override
  Future<List<PowerSupplyProtectionFunctions>> getList() async {
    return _powerSupplyPFRepository.getAllData();
  }

  @override
  Future<PowerSupplyProtectionFunctions?> getDataById(int? id) async {
    return _powerSupplyPFRepository.getDataById(id);
  }

  @override
  Future<void> updateData(PowerSupplyProtectionFunctions data) async {
    await _powerSupplyPFRepository.updateData(data);
  }

  @override
  Future<PowerSupplyProtectionFunctions?> postData(
    PowerSupplyProtectionFunctions data,
  ) async {
    await _powerSupplyPFRepository.postData(data);

    return getDataById(data.id);
  }

  @override
  Future<void> delete(int id) async {
    await _powerSupplyPFRepository.deleteData(id);
  }
}
