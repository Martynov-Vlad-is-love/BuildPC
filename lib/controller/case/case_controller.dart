import 'package:buildpc/model/case/case.dart';
import 'package:buildpc/repository/case/case_repository.dart';

class CaseController{
  final CaseRepository _caseRepository;
  CaseController(this._caseRepository);

  Future<List<Case>> getCaseList() async{
    return _caseRepository.getAllData();
  }

  Future<Case?> getCaseData(int? id) async{
    return _caseRepository.getDataById(id);
  }

  Future<void> updateCaseData(Case pcCase) async{
    await _caseRepository.updateData(pcCase);
  }

  Future<Case?> postCaseData(Case pcCase) async{
    await _caseRepository.postData(pcCase);

    return getCaseData(pcCase.id);
  }

  Future<void> deleteCase(int id) async{
    await _caseRepository.deleteData(id);
  }
}
