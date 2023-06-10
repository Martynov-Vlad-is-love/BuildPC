import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/motherboard/motherboard.dart';
import 'package:buildpc/repository/motherboard/motherboard_repository.dart';

class MotherboardController implements ModelControllerAbstract<Motherboard>{
  final MotherboardRepository _motherboardRepository;

  MotherboardController(this._motherboardRepository);

  @override
  Future<List<Motherboard>> getList() async {
    return _motherboardRepository.getAllData();
  }

  @override
  Future<Motherboard?> getDataById(int? id) async {
    return _motherboardRepository.getDataById(id);
  }

  @override
  Future<void> updateData(Motherboard data) async {
    await _motherboardRepository.updateData(data);
  }

  @override
  Future<Motherboard?> postData(Motherboard data) async {
    await _motherboardRepository.postData(data);

    return getDataById(data.id);
  }

  @override
  Future<void> delete(int id) async {
    await _motherboardRepository.deleteData(id);
  }
}
