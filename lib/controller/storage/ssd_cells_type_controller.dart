import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/storage/ssd_cells_type.dart';
import 'package:buildpc/repository/storage/ssd_cells_type_repository.dart';
import 'package:flutter/cupertino.dart';

class SsdCellsTypeController extends ChangeNotifier
    implements ModelControllerAbstract<SsdCellsType> {
  final SsdCellsTypeRepository _ssdCellsTypeRepository;

  SsdCellsTypeController(this._ssdCellsTypeRepository);

  @override
  Future<List<SsdCellsType>> getList() async {
    final result = _ssdCellsTypeRepository.getAllData();
    notifyListeners();

    return result;
  }

  @override
  Future<SsdCellsType?> getDataById(int? id) async {
    final result = _ssdCellsTypeRepository.getDataById(id);
    notifyListeners();

    return result;
  }

  @override
  Future<void> updateData(SsdCellsType data) async {
    await _ssdCellsTypeRepository.updateData(data);
    notifyListeners();
  }

  @override
  Future<void> postData(SsdCellsType data) async {
    await _ssdCellsTypeRepository.postData(data);
    notifyListeners();
  }

  @override
  Future<void> delete(int id) async {
    await _ssdCellsTypeRepository.deleteData(id);
    notifyListeners();
  }
}
