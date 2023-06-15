import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/general/producers.dart';
import 'package:buildpc/repository/general/producers_repository.dart';
import 'package:flutter/cupertino.dart';

class ProducersController extends ChangeNotifier
    implements ModelControllerAbstract<Producers> {
  final ProducersRepository _producersRepository;

  ProducersController(this._producersRepository);

  @override
  Future<List<Producers>> getList() async {
    final result = _producersRepository.getAllData();
    notifyListeners();

    return result;
  }

  @override
  Future<Producers?> getDataById(int? id) async {
    final result = _producersRepository.getDataById(id);
    notifyListeners();

    return result;
  }

  @override
  Future<void> updateData(Producers data) async {
    await _producersRepository.updateData(data);
    notifyListeners();
  }

  @override
  Future<void> postData(Producers data) async {
    await _producersRepository.postData(data);
    notifyListeners();
  }

  @override
  Future<void> delete(int id) async {
    await _producersRepository.deleteData(id);
    notifyListeners();
  }
}
