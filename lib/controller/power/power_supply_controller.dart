import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/power/power_supply.dart';
import 'package:buildpc/repository/power/power_supply_repository.dart';

class PowerSupplyController implements ModelControllerAbstract<PowerSupply>{
  final PowerSupplyRepository _powerSupplyRepository;

  PowerSupplyController(this._powerSupplyRepository);

  @override
  Future<List<PowerSupply>> getList() async {
    return _powerSupplyRepository.getAllData();
  }

  @override
  Future<PowerSupply?> getDataById(int? id) async {
    return _powerSupplyRepository.getDataById(id);
  }

  @override
  Future<void> updateData(PowerSupply data) async {
    await _powerSupplyRepository.updateData(data);
  }

  @override
  Future<PowerSupply?> postData(PowerSupply data) async {
    await _powerSupplyRepository.postData(data);

    return getDataById(data.id);
  }

  @override
  Future<void> delete(int id) async {
    await _powerSupplyRepository.deleteData(id);
  }
}
