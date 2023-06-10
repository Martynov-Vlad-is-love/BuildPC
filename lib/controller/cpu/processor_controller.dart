import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/cpu/processor.dart';
import 'package:buildpc/repository/cpu/processor_repository.dart';

class ProcessorController implements ModelControllerAbstract<Processor>{
  final ProcessorRepository _processorRepository;

  ProcessorController(this._processorRepository);

  @override
  Future<List<Processor>> getList() async {
    return _processorRepository.getAllData();
  }

  @override
  Future<Processor?> getDataById(int? id) async {
    return _processorRepository.getDataById(id);
  }

  @override
  Future<void> updateData(Processor data) async {
    await _processorRepository.updateData(data);
  }

  @override
  Future<Processor?> postData(Processor data) async {
    await _processorRepository.postData(data);

    return getDataById(data.id);
  }

  @override
  Future<void> delete(int id) async {
    await _processorRepository.deleteData(id);
  }
}
