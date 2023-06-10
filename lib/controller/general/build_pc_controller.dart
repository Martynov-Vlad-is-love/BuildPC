import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/general/build_pc.dart';
import 'package:buildpc/repository/general/build_pc_repository.dart';
import 'package:flutter/cupertino.dart';

class BuildPcController extends ChangeNotifier implements ModelControllerAbstract<BuildPC>{
  final BuildPcRepository _buildPcRepository;

  BuildPcController(this._buildPcRepository);

  @override
  Future<List<BuildPC>> getList() async {
    final data = _buildPcRepository.getAllData();
    notifyListeners();

    return data;
  }

  @override
  Future<BuildPC?> getDataById(int? id) async {
    final data =_buildPcRepository.getDataById(id);
    notifyListeners();

    return data;
  }

  @override
  Future<void> updateData(BuildPC data) async {
    await _buildPcRepository.updateData(data);
    notifyListeners();
  }

  @override
  Future<BuildPC?> postData(BuildPC data) async {
    await _buildPcRepository.postData(data);
    notifyListeners();

    return getDataById(data.id);
  }

  @override
  Future<void> delete(int id) async {
    await _buildPcRepository.deleteData(id);
    notifyListeners();
  }
}
