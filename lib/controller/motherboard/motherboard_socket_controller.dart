import 'package:buildpc/model/motherboard/motherboard_socket.dart';
import 'package:buildpc/repository/motherboard/motherboard_socket_repository.dart';

class MotherboardSocketController {
  final MotherboardSocketRepository _motherboardSocketRepository;

  MotherboardSocketController(this._motherboardSocketRepository);

  Future<List<MotherboardSocket>> getList() async {
    return _motherboardSocketRepository.getAllData();
  }

  Future<MotherboardSocket?> getDataById(int? id) async {
    return _motherboardSocketRepository.getDataById(id);
  }

  Future<void> updateData(MotherboardSocket data) async {
    await _motherboardSocketRepository.updateData(data);
  }

  Future<MotherboardSocket?> postData(MotherboardSocket data) async {
    await _motherboardSocketRepository.postData(data);

    return getDataById(data.id);
  }

  Future<void> delete(int id) async {
    await _motherboardSocketRepository.deleteData(id);
  }
}
