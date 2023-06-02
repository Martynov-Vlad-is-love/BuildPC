import 'package:buildpc/model/ram/ram.dart';
import 'package:buildpc/repository/ram/ram_repository.dart';

class RamController {
  final RamRepository _ramRepository;

  RamController(this._ramRepository);

  Future<List<Ram>> getList() async {
    return _ramRepository.getAllData();
  }

  Future<Ram?> getDataById(int? id) async {
    return _ramRepository.getDataById(id);
  }

  Future<void> updateData(Ram data) async {
    await _ramRepository.updateData(data);
  }

  Future<Ram?> postData(Ram data) async {
    await _ramRepository.postData(data);

    return getDataById(data.id);
  }

  Future<void> delete(int id) async {
    await _ramRepository.deleteData(id);
  }
}
