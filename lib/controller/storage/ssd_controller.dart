import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/storage/ssd.dart';
import 'package:buildpc/repository/storage/ssd_repository.dart';

class SsdController implements ModelControllerAbstract<Ssd>{
  final SsdRepository _ssdRepository;

  SsdController(this._ssdRepository);

  @override
  Future<List<Ssd>> getList() async {
    return _ssdRepository.getAllData();
  }

  @override
  Future<Ssd?> getDataById(int? id) async {
    return _ssdRepository.getDataById(id);
  }

  @override
  Future<void> updateData(Ssd data) async {
    await _ssdRepository.updateData(data);
  }

  @override
  Future<Ssd?> postData(Ssd data) async {
    await _ssdRepository.postData(data);

    return getDataById(data.id);
  }

  @override
  Future<void> delete(int id) async {
    await _ssdRepository.deleteData(id);
  }
}
