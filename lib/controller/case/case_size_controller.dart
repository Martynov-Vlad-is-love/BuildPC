import 'package:buildpc/model/case/case_size.dart';
import 'package:buildpc/repository/case/case_size_repository.dart';

class CaseSizeController{
  final CaseSizeRepository _caseSizeRepository;
  CaseSizeController(this._caseSizeRepository);

  Future<List<CaseSize>> getList() async{
    return _caseSizeRepository.getAllData();
  }

  Future<CaseSize?> getDataById(int? id) async{
    return _caseSizeRepository.getDataById(id);
  }

  Future<void> updateData(CaseSize data) async{
    await _caseSizeRepository.updateData(data);
  }

  Future<CaseSize?> postData(CaseSize data) async{
    await _caseSizeRepository.postData(data);

    return getDataById(data.id);
  }

  Future<void> delete(int id) async{
    await _caseSizeRepository.deleteData(id);
  }
}
