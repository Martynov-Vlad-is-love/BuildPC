import 'package:buildpc/model/storage/hdd.dart';
import 'package:buildpc/repository/storage/hdd_repository.dart';

class HddController {
  final HddRepository _hddRepository;

  HddController(this._hddRepository);

  Future<List<Hdd>> getList() async {
    return _hddRepository.getAllData();
  }

  Future<Hdd?> getDataById(int? id) async {
    return _hddRepository.getDataById(id);
  }

  Future<void> updateData(Hdd data) async {
    await _hddRepository.updateData(data);
  }

  Future<Hdd?> postData(Hdd data) async {
    await _hddRepository.postData(data);

    return getDataById(data.id);
  }

  Future<void> delete(int id) async {
    await _hddRepository.deleteData(id);
  }
}
