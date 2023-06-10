import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/cooler/cooler_socket.dart';
import 'package:buildpc/repository/cooler/cooler_socket_repository.dart';

class CoolerSocketController implements ModelControllerAbstract<CoolerSocket>{
  final CoolerSocketRepository _coolerSocketRepository;
  CoolerSocketController(this._coolerSocketRepository);

  @override
  Future<List<CoolerSocket>> getList() async{
    return _coolerSocketRepository.getAllData();
  }

  @override
  Future<CoolerSocket?> getDataById(int? id) async{
    return _coolerSocketRepository.getDataById(id);
  }

  @override
  Future<void> updateData(CoolerSocket data) async{
    await _coolerSocketRepository.updateData(data);
  }

  @override
  Future<void> postData(CoolerSocket data) async{
    await _coolerSocketRepository.postData(data);
  }

  @override
  Future<void> delete(int id) async{
    await _coolerSocketRepository.deleteData(id);
  }
}
