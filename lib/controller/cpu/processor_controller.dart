import 'package:buildpc/model/cpu/processor.dart';
import 'package:buildpc/repository/cpu/processor_repository.dart';

class ProcessorController {
  final ProcessorRepository _processorRepository;

  ProcessorController(this._processorRepository);

  Future<List<Processor>> getList() async {
    return _processorRepository.getAllData();
  }

  Future<Processor?> getDataById(int? id) async {
    return _processorRepository.getDataById(id);
  }

  Future<void> updateData(Processor data) async {
    await _processorRepository.updateData(data);
  }

  Future<Processor?> postData(Processor data) async {
    await _processorRepository.postData(data);

    return getDataById(data.id);
  }

  Future<void> delete(int id) async {
    await _processorRepository.deleteData(id);
  }
}
