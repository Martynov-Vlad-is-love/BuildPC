import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/motherboard/motherboard_network.dart';
import 'package:buildpc/repository/motherboard/motherboard_network_repository.dart';

class MotherboardNetworkController
    implements ModelControllerAbstract<MotherboardNetwork> {
  final MotherboardNetworkRepository _motherboardNetworkRepository;

  MotherboardNetworkController(this._motherboardNetworkRepository);

  @override
  Future<List<MotherboardNetwork>> getList() async {
    return _motherboardNetworkRepository.getAllData();
  }

  @override
  Future<MotherboardNetwork?> getDataById(int? id) async {
    return _motherboardNetworkRepository.getDataById(id);
  }

  @override
  Future<void> updateData(MotherboardNetwork data) async {
    await _motherboardNetworkRepository.updateData(data);
  }

  @override
  Future<MotherboardNetwork?> postData(MotherboardNetwork data) async {
    await _motherboardNetworkRepository.postData(data);

    return getDataById(data.id);
  }

  @override
  Future<void> delete(int id) async {
    await _motherboardNetworkRepository.deleteData(id);
  }
}
