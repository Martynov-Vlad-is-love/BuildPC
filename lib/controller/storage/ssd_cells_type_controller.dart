import 'package:buildpc/model/storage/ssd_cells_type.dart';
import 'package:buildpc/repository/storage/ssd_cells_type_repository.dart';

class SsdCellsTypeController {
  final SsdCellsTypeRepository _ssdCellsTypeRepository;

  SsdCellsTypeController(this._ssdCellsTypeRepository);

  Future<List<SsdCellsType>> getList() async {
    return _ssdCellsTypeRepository.getAllData();
  }

  Future<SsdCellsType?> getDataById(int? id) async {
    return _ssdCellsTypeRepository.getDataById(id);
  }

  Future<void> updateData(SsdCellsType data) async {
    await _ssdCellsTypeRepository.updateData(data);
  }

  Future<SsdCellsType?> postData(SsdCellsType data) async {
    await _ssdCellsTypeRepository.postData(data);

    return getDataById(data.id);
  }

  Future<void> delete(int id) async {
    await _ssdCellsTypeRepository.deleteData(id);
  }
}
