import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/case/case.dart';
import 'package:buildpc/repository/case/case_repository.dart';

class CaseController implements ModelControllerAbstract<Case>{
  final CaseRepository _caseRepository;
  CaseController(this._caseRepository);

  @override
  Future<List<Case>> getList() async{
    return _caseRepository.getAllData();
  }

  @override
  Future<Case?> getDataById(int? id) async{
    return _caseRepository.getDataById(id);
  }

  @override
  Future<void> updateData(Case data) async{
    await _caseRepository.updateData(data);
  }

  @override
  Future<Case?> postData(Case data) async{
    await _caseRepository.postData(data);

    return getDataById(data.id);
  }

  @override
  Future<void> delete(int id) async{
    await _caseRepository.deleteData(id);
  }
}
