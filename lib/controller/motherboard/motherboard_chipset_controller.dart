import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/motherboard/motherboard_chipset.dart';
import 'package:buildpc/repository/motherboard/motherboard_chipset_repository.dart';
import 'package:flutter/cupertino.dart';

class MotherboardChipsetController extends ChangeNotifier
    implements ModelControllerAbstract<MotherboardChipset> {
  final MotherboardChipsetRepository _motherboardChipsetRepository;

  MotherboardChipsetController(this._motherboardChipsetRepository);

  @override
  Future<List<MotherboardChipset>> getList() async {
    final result = _motherboardChipsetRepository.getAllData();
    notifyListeners();

    return result;
  }

  @override
  Future<MotherboardChipset?> getDataById(int? id) async {
    final result = _motherboardChipsetRepository.getDataById(id);
    notifyListeners();

    return result;
  }

  @override
  Future<void> updateData(MotherboardChipset data) async {
    await _motherboardChipsetRepository.updateData(data);
    notifyListeners();
  }

  @override
  Future<void> postData(MotherboardChipset data) async {
    await _motherboardChipsetRepository.postData(data);
    notifyListeners();
  }

  @override
  Future<void> delete(int id) async {
    await _motherboardChipsetRepository.deleteData(id);
    notifyListeners();
  }
}
