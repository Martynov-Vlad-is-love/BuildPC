import 'package:buildpc/model/motherboard/motherboard_network.dart';
import 'package:buildpc/repository/motherboard/motherboard_network_repository.dart';

class MotherboardNetworkController {
  final MotherboardNetworkRepository _motherboardNetworkRepository;

  MotherboardNetworkController(this._motherboardNetworkRepository);

  Future<List<MotherboardNetwork>> getList() async {
    return _motherboardNetworkRepository.getAllData();
  }

  Future<MotherboardNetwork?> getDataById(int? id) async {
    return _motherboardNetworkRepository.getDataById(id);
  }

  Future<void> updateData(MotherboardNetwork data) async {
    await _motherboardNetworkRepository.updateData(data);
  }

  Future<MotherboardNetwork?> postData(MotherboardNetwork data) async {
    await _motherboardNetworkRepository.postData(data);

    return getDataById(data.id);
  }

  Future<void> delete(int id) async {
    await _motherboardNetworkRepository.deleteData(id);
  }
}
