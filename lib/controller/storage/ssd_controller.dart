import 'package:buildpc/model/storage/ssd.dart';
import 'package:buildpc/repository/storage/ssd_repository.dart';

class SsdController {
  final SsdRepository _ssdRepository;

  SsdController(this._ssdRepository);

  Future<List<Ssd>> getList() async {
    return _ssdRepository.getAllData();
  }

  Future<Ssd?> getDataById(int? id) async {
    return _ssdRepository.getDataById(id);
  }

  Future<void> updateData(Ssd data) async {
    await _ssdRepository.updateData(data);
  }

  Future<Ssd?> postData(Ssd data) async {
    await _ssdRepository.postData(data);

    return getDataById(data.id);
  }

  Future<void> delete(int id) async {
    await _ssdRepository.deleteData(id);
  }
}
