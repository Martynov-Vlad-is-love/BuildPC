import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/cpu/processor.dart';
import 'package:buildpc/repository/cpu/processor_repository.dart';
import 'package:flutter/cupertino.dart';

class ProcessorController extends ChangeNotifier
    implements ModelControllerAbstract<Processor> {
  final ProcessorRepository _processorRepository;

  ProcessorController(this._processorRepository);

  @override
  Future<List<Processor>> getList() async {
    final result = _processorRepository.getAllData();
    notifyListeners();

    return result;
  }

  @override
  Future<Processor?> getDataById(int? id) async {
    final result = _processorRepository.getDataById(id);
    notifyListeners();

    return result;
  }

  @override
  Future<void> updateData(Processor data) async {
    await _processorRepository.updateData(data);
    notifyListeners();
  }

  @override
  Future<void> postData(Processor data) async {
    await _processorRepository.postData(data);
    notifyListeners();
  }

  @override
  Future<void> delete(int id) async {
    await _processorRepository.deleteData(id);
    notifyListeners();
  }
}
