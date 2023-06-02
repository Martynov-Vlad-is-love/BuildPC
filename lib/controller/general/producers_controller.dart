import 'package:buildpc/model/general/producers.dart';
import 'package:buildpc/repository/general/producers_repository.dart';

class ProducersController {
  final ProducersRepository _producersRepository;

  ProducersController(this._producersRepository);

  Future<List<Producers>> getList() async {
    return _producersRepository.getAllData();
  }

  Future<Producers?> getDataById(int? id) async {
    return _producersRepository.getDataById(id);
  }

  Future<void> updateData(Producers data) async {
    await _producersRepository.updateData(data);
  }

  Future<Producers?> postData(Producers data) async {
    await _producersRepository.postData(data);

    return getDataById(data.id);
  }

  Future<void> delete(int id) async {
    await _producersRepository.deleteData(id);
  }
}
