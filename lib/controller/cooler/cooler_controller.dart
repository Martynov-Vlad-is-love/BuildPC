import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/cooler/cooler.dart';
import 'package:buildpc/repository/cooler/cooler_repository.dart';

class CoolerController implements ModelControllerAbstract<Cooler>{
  final CoolerRepository _coolerRepository;
  CoolerController(this._coolerRepository);

  @override
  Future<List<Cooler>> getList() async{
    return _coolerRepository.getAllData();
  }

  @override
  Future<Cooler?> getDataById(int? id) async{
    return _coolerRepository.getDataById(id);
  }

  @override
  Future<void> updateData(Cooler data) async{
    await _coolerRepository.updateData(data);
  }

  @override
  Future<void> postData(Cooler data) async{
    await _coolerRepository.postData(data);
  }

  @override
  Future<void> delete(int id) async{
    await _coolerRepository.deleteData(id);
  }
}
