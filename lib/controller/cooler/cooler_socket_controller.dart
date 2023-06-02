import 'package:buildpc/model/cooler/cooler_socket.dart';
import 'package:buildpc/repository/cooler/cooler_socket_repository.dart';

class CoolerSocketController{
  final CoolerSocketRepository _coolerSocketRepository;
  CoolerSocketController(this._coolerSocketRepository);

  Future<List<CoolerSocket>> getList() async{
    return _coolerSocketRepository.getAllData();
  }

  Future<CoolerSocket?> getDataById(int? id) async{
    return _coolerSocketRepository.getDataById(id);
  }

  Future<void> updateData(CoolerSocket data) async{
    await _coolerSocketRepository.updateData(data);
  }

  Future<CoolerSocket?> postData(CoolerSocket data) async{
    await _coolerSocketRepository.postData(data);

    return getDataById(data.id);
  }

  Future<void> delete(int id) async{
    await _coolerSocketRepository.deleteData(id);
  }
}
