import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/case/case_power_supply_location.dart';
import 'package:buildpc/repository/case/case_power_supply_location_repository.dart';

class CasePowerSupplyLocationController
    implements ModelControllerAbstract<CasePowerSupplyLocation> {
  final CasePowerSupplyLocationRepository _casePowerSupplyLocationRepository;

  CasePowerSupplyLocationController(this._casePowerSupplyLocationRepository);

  @override
  Future<List<CasePowerSupplyLocation>> getList() async {
    return _casePowerSupplyLocationRepository.getAllData();
  }

  @override
  Future<CasePowerSupplyLocation?> getDataById(int? id) async {
    return _casePowerSupplyLocationRepository.getDataById(id);
  }

  @override
  Future<void> updateData(CasePowerSupplyLocation data) async {
    await _casePowerSupplyLocationRepository.updateData(data);
  }

  @override
  Future<CasePowerSupplyLocation?> postData(
      CasePowerSupplyLocation data) async {
    await _casePowerSupplyLocationRepository.postData(data);

    return getDataById(data.id);
  }

  @override
  Future<void> delete(int id) async {
    await _casePowerSupplyLocationRepository.deleteData(id);
  }
}
