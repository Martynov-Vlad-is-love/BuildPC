import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/motherboard/motherboard_chipset.dart';
import 'package:buildpc/repository/motherboard/motherboard_chipset_repository.dart';

class MotherboardChipsetController
    implements ModelControllerAbstract<MotherboardChipset> {
  final MotherboardChipsetRepository _motherboardChipsetRepository;

  MotherboardChipsetController(this._motherboardChipsetRepository);

  @override
  Future<List<MotherboardChipset>> getList() async {
    return _motherboardChipsetRepository.getAllData();
  }

  @override
  Future<MotherboardChipset?> getDataById(int? id) async {
    return _motherboardChipsetRepository.getDataById(id);
  }

  @override
  Future<void> updateData(MotherboardChipset data) async {
    await _motherboardChipsetRepository.updateData(data);
  }

  @override
  Future<MotherboardChipset?> postData(MotherboardChipset data) async {
    await _motherboardChipsetRepository.postData(data);

    return getDataById(data.id);
  }

  @override
  Future<void> delete(int id) async {
    await _motherboardChipsetRepository.deleteData(id);
  }
}
