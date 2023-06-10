import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/motherboard/motherboard_socket.dart';
import 'package:buildpc/repository/motherboard/motherboard_socket_repository.dart';

class MotherboardSocketController
    implements ModelControllerAbstract<MotherboardSocket> {
  final MotherboardSocketRepository _motherboardSocketRepository;

  MotherboardSocketController(this._motherboardSocketRepository);

  @override
  Future<List<MotherboardSocket>> getList() async {
    return _motherboardSocketRepository.getAllData();
  }

  @override
  Future<MotherboardSocket?> getDataById(int? id) async {
    return _motherboardSocketRepository.getDataById(id);
  }

  @override
  Future<void> updateData(MotherboardSocket data) async {
    await _motherboardSocketRepository.updateData(data);
  }

  @override
  Future<MotherboardSocket?> postData(MotherboardSocket data) async {
    await _motherboardSocketRepository.postData(data);

    return getDataById(data.id);
  }

  @override
  Future<void> delete(int id) async {
    await _motherboardSocketRepository.deleteData(id);
  }
}
