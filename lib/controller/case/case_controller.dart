import 'package:buildpc/model/case/case.dart';
import 'package:buildpc/repository/case/case_repository.dart';

class CaseController{
  final CaseRepository _caseRepository;
  CaseController(this._caseRepository);

  Future<List<Case>> getList() async{
    return _caseRepository.getAllData();
  }

  Future<Case?> getDataById(int? id) async{
    return _caseRepository.getDataById(id);
  }

  Future<void> updateData(Case data) async{
    await _caseRepository.updateData(data);
  }

  Future<Case?> postData(Case data) async{
    await _caseRepository.postData(data);

    return getDataById(data.id);
  }

  Future<void> delete(int id) async{
    await _caseRepository.deleteData(id);
  }
}
