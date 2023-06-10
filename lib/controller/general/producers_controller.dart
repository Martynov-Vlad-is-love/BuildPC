import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/general/producers.dart';
import 'package:buildpc/repository/general/producers_repository.dart';

class ProducersController implements ModelControllerAbstract<Producers>{
  final ProducersRepository _producersRepository;

  ProducersController(this._producersRepository);

  @override
  Future<List<Producers>> getList() async {
    return _producersRepository.getAllData();
  }

  @override
  Future<Producers?> getDataById(int? id) async {
    return _producersRepository.getDataById(id);
  }

  @override
  Future<void> updateData(Producers data) async {
    await _producersRepository.updateData(data);
  }

  @override
  Future<void> postData(Producers data) async {
    await _producersRepository.postData(data);

  }

  @override
  Future<void> delete(int id) async {
    await _producersRepository.deleteData(id);
  }
}
