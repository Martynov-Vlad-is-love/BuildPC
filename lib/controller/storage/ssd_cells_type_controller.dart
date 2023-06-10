import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/storage/ssd_cells_type.dart';
import 'package:buildpc/repository/storage/ssd_cells_type_repository.dart';

class SsdCellsTypeController implements ModelControllerAbstract<SsdCellsType>{
  final SsdCellsTypeRepository _ssdCellsTypeRepository;

  SsdCellsTypeController(this._ssdCellsTypeRepository);

  @override
  Future<List<SsdCellsType>> getList() async {
    return _ssdCellsTypeRepository.getAllData();
  }

  @override
  Future<SsdCellsType?> getDataById(int? id) async {
    return _ssdCellsTypeRepository.getDataById(id);
  }

  @override
  Future<void> updateData(SsdCellsType data) async {
    await _ssdCellsTypeRepository.updateData(data);
  }

  @override
  Future<SsdCellsType?> postData(SsdCellsType data) async {
    await _ssdCellsTypeRepository.postData(data);

    return getDataById(data.id);
  }

  @override
  Future<void> delete(int id) async {
    await _ssdCellsTypeRepository.deleteData(id);
  }
}
