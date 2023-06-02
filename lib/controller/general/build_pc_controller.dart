import 'package:buildpc/model/general/build_pc.dart';
import 'package:buildpc/repository/general/build_pc_repository.dart';

class BuildPcController {
  final BuildPcRepository _buildPcRepository;

  BuildPcController(this._buildPcRepository);

  Future<List<BuildPC>> getList() async {
    return _buildPcRepository.getAllData();
  }

  Future<BuildPC?> getDataById(int? id) async {
    return _buildPcRepository.getDataById(id);
  }

  Future<void> updateData(BuildPC data) async {
    await _buildPcRepository.updateData(data);
  }

  Future<BuildPC?> postData(BuildPC data) async {
    await _buildPcRepository.postData(data);

    return getDataById(data.id);
  }

  Future<void> delete(int id) async {
    await _buildPcRepository.deleteData(id);
  }
}
