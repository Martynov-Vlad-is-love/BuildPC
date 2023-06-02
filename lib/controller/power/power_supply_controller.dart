import 'package:buildpc/model/power/power_supply.dart';
import 'package:buildpc/repository/power/power_supply_repository.dart';

class PowerSupplyController {
  final PowerSupplyRepository _powerSupplyRepository;

  PowerSupplyController(this._powerSupplyRepository);

  Future<List<PowerSupply>> getList() async {
    return _powerSupplyRepository.getAllData();
  }

  Future<PowerSupply?> getDataById(int? id) async {
    return _powerSupplyRepository.getDataById(id);
  }

  Future<void> updateData(PowerSupply data) async {
    await _powerSupplyRepository.updateData(data);
  }

  Future<PowerSupply?> postData(PowerSupply data) async {
    await _powerSupplyRepository.postData(data);

    return getDataById(data.id);
  }

  Future<void> delete(int id) async {
    await _powerSupplyRepository.deleteData(id);
  }
}
