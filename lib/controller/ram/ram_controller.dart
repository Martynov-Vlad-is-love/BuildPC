import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/ram/ram.dart';
import 'package:buildpc/repository/ram/ram_repository.dart';

class RamController implements ModelControllerAbstract<Ram>{
  final RamRepository _ramRepository;

  RamController(this._ramRepository);

  @override
  Future<List<Ram>> getList() async {
    return _ramRepository.getAllData();
  }

  @override
  Future<Ram?> getDataById(int? id) async {
    return _ramRepository.getDataById(id);
  }

  @override
  Future<void> updateData(Ram data) async {
    await _ramRepository.updateData(data);
  }

  @override
  Future<Ram?> postData(Ram data) async {
    await _ramRepository.postData(data);

    return getDataById(data.id);
  }

  @override
  Future<void> delete(int id) async {
    await _ramRepository.deleteData(id);
  }
}
