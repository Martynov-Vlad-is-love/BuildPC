import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/case/case_design_features.dart';
import 'package:buildpc/repository/case/case_design_features_repository.dart';

class CaseDesignFeaturesController
    implements ModelControllerAbstract<CaseDesignFeatures> {
  final CaseDesignFeaturesRepository _caseDesignFeaturesRepository;

  CaseDesignFeaturesController(this._caseDesignFeaturesRepository);

  @override
  Future<List<CaseDesignFeatures>> getList() async {
    return _caseDesignFeaturesRepository.getAllData();
  }

  @override
  Future<CaseDesignFeatures?> getDataById(int? id) async {
    return _caseDesignFeaturesRepository.getDataById(id);
  }

  @override
  Future<void> updateData(CaseDesignFeatures data) async {
    await _caseDesignFeaturesRepository.updateData(data);
  }

  @override
  Future<CaseDesignFeatures?> postData(CaseDesignFeatures data) async {
    await _caseDesignFeaturesRepository.postData(data);

    return getDataById(data.id);
  }

  @override
  Future<void> delete(int id) async {
    await _caseDesignFeaturesRepository.deleteData(id);
  }
}
