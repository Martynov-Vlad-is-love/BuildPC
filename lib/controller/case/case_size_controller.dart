import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/case/case_size.dart';
import 'package:buildpc/repository/case/case_size_repository.dart';

class CaseSizeController implements ModelControllerAbstract<CaseSize>{
  final CaseSizeRepository _caseSizeRepository;
  CaseSizeController(this._caseSizeRepository);

  @override
  Future<List<CaseSize>> getList() async{
    return _caseSizeRepository.getAllData();
  }

  @override
  Future<CaseSize?> getDataById(int? id) async{
    return _caseSizeRepository.getDataById(id);
  }

  @override
  Future<void> updateData(CaseSize data) async{
    await _caseSizeRepository.updateData(data);
  }

  @override
  Future<CaseSize?> postData(CaseSize data) async{
    await _caseSizeRepository.postData(data);

    return getDataById(data.id);
  }

  @override
  Future<void> delete(int id) async{
    await _caseSizeRepository.deleteData(id);
  }
}
