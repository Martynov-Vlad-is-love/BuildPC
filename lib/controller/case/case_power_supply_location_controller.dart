import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/case/case_power_supply_location.dart';
import 'package:buildpc/repository/case/case_power_supply_location_repository.dart';
import 'package:flutter/cupertino.dart';

class CasePowerSupplyLocationController extends ChangeNotifier
    implements ModelControllerAbstract<CasePowerSupplyLocation> {
  final CasePowerSupplyLocationRepository _casePowerSupplyLocationRepository;

  CasePowerSupplyLocationController(this._casePowerSupplyLocationRepository);

  @override
  Future<List<CasePowerSupplyLocation>> getList() async {
    final result = await _casePowerSupplyLocationRepository.getAllData();
    notifyListeners();

    return result;
  }

  @override
  Future<CasePowerSupplyLocation?> getDataById(int? id) async {
    final result = await _casePowerSupplyLocationRepository.getDataById(id);
    notifyListeners();

    return result;
  }

  @override
  Future<void> updateData(CasePowerSupplyLocation data) async {
    await _casePowerSupplyLocationRepository.updateData(data);
    notifyListeners();
  }

  @override
  Future<void> postData(
    CasePowerSupplyLocation data,
  ) async {
    await _casePowerSupplyLocationRepository.postData(data);
    notifyListeners();
  }

  @override
  Future<void> delete(int id) async {
    await _casePowerSupplyLocationRepository.deleteData(id);
    notifyListeners();
  }
}
