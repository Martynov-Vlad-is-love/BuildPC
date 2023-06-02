import 'package:buildpc/model/motherboard/motherboard_chipset.dart';
import 'package:buildpc/repository/motherboard/motherboard_chipset_repository.dart';

class MotherboardChipsetController {
  final MotherboardChipsetRepository _motherboardChipsetRepository;

  MotherboardChipsetController(this._motherboardChipsetRepository);

  Future<List<MotherboardChipset>> getList() async {
    return _motherboardChipsetRepository.getAllData();
  }

  Future<MotherboardChipset?> getDataById(int? id) async {
    return _motherboardChipsetRepository.getDataById(id);
  }

  Future<void> updateData(MotherboardChipset data) async {
    await _motherboardChipsetRepository.updateData(data);
  }

  Future<MotherboardChipset?> postData(MotherboardChipset data) async {
    await _motherboardChipsetRepository.postData(data);

    return getDataById(data.id);
  }

  Future<void> delete(int id) async {
    await _motherboardChipsetRepository.deleteData(id);
  }
}
