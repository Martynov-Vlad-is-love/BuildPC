import 'package:buildpc/model/cooler/cooler.dart';
import 'package:buildpc/repository/cooler/cooler_repository.dart';

class CoolerController{
  final CoolerRepository _coolerRepository;
  CoolerController(this._coolerRepository);

  Future<List<Cooler>> getList() async{
    return _coolerRepository.getAllData();
  }

  Future<Cooler?> getDataById(int? id) async{
    return _coolerRepository.getDataById(id);
  }

  Future<void> updateData(Cooler data) async{
    await _coolerRepository.updateData(data);
  }

  Future<Cooler?> postData(Cooler data) async{
    await _coolerRepository.postData(data);

    return getDataById(data.id);
  }

  Future<void> delete(int id) async{
    await _coolerRepository.deleteData(id);
  }
}
