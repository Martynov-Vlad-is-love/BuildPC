import 'package:buildpc/model/case/case_power_supply_location.dart';
import 'package:buildpc/repository/case/case_power_supply_location_repository.dart';

class CasePowerSupplyLocationController{
  final CasePowerSupplyLocationRepository _casePowerSupplyLocationRepository;
  CasePowerSupplyLocationController(this._casePowerSupplyLocationRepository);

  Future<List<CasePowerSupplyLocation>> getList() async{
    return _casePowerSupplyLocationRepository.getAllData();
  }

  Future<CasePowerSupplyLocation?> getDataById(int? id) async{
    return _casePowerSupplyLocationRepository.getDataById(id);
  }

  Future<void> updateData(CasePowerSupplyLocation data) async{
    await _casePowerSupplyLocationRepository.updateData(data);
  }

  Future<CasePowerSupplyLocation?> postData(CasePowerSupplyLocation data) async{
    await _casePowerSupplyLocationRepository.postData(data);

    return getDataById(data.id);
  }

  Future<void> delete(int id) async{
    await _casePowerSupplyLocationRepository.deleteData(id);
  }
}
