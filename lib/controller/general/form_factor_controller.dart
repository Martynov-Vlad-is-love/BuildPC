import 'package:buildpc/model/general/form_factor.dart';
import 'package:buildpc/repository/general/form_factor_repository.dart';

class FormFactorController {
  final FormFactorRepository _formFactorRepository;

  FormFactorController(this._formFactorRepository);

  Future<List<FormFactor>> getList() async {
    return _formFactorRepository.getAllData();
  }

  Future<FormFactor?> getDataById(int? id) async {
    return _formFactorRepository.getDataById(id);
  }

  Future<void> updateData(FormFactor data) async {
    await _formFactorRepository.updateData(data);
  }

  Future<FormFactor?> postData(FormFactor data) async {
    await _formFactorRepository.postData(data);

    return getDataById(data.id);
  }

  Future<void> delete(int id) async {
    await _formFactorRepository.deleteData(id);
  }
}
