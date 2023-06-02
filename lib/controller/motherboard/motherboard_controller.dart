import 'package:buildpc/model/motherboard/motherboard.dart';
import 'package:buildpc/repository/motherboard/motherboard_repository.dart';

class MotherboardController {
  final MotherboardRepository _motherboardRepository;

  MotherboardController(this._motherboardRepository);

  Future<List<Motherboard>> getList() async {
    return _motherboardRepository.getAllData();
  }

  Future<Motherboard?> getDataById(int? id) async {
    return _motherboardRepository.getDataById(id);
  }

  Future<void> updateData(Motherboard data) async {
    await _motherboardRepository.updateData(data);
  }

  Future<Motherboard?> postData(Motherboard data) async {
    await _motherboardRepository.postData(data);

    return getDataById(data.id);
  }

  Future<void> delete(int id) async {
    await _motherboardRepository.deleteData(id);
  }
}
