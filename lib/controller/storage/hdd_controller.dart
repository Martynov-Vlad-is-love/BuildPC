import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/storage/hdd.dart';
import 'package:buildpc/repository/storage/hdd_repository.dart';

class HddController implements ModelControllerAbstract<Hdd>{
  final HddRepository _hddRepository;

  HddController(this._hddRepository);

  @override
  Future<List<Hdd>> getList() async {
    return _hddRepository.getAllData();
  }

  @override
  Future<Hdd?> getDataById(int? id) async {
    return _hddRepository.getDataById(id);
  }

  @override
  Future<void> updateData(Hdd data) async {
    await _hddRepository.updateData(data);
  }

  @override
  Future<Hdd?> postData(Hdd data) async {
    await _hddRepository.postData(data);

    return getDataById(data.id);
  }

  @override
  Future<void> delete(int id) async {
    await _hddRepository.deleteData(id);
  }
}
