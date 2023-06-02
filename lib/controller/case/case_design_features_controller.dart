import 'package:buildpc/model/case/case_design_features.dart';
import 'package:buildpc/repository/case/case_design_features_repository.dart';

class CaseDesignFeaturesController {
  final CaseDesignFeaturesRepository _caseDesignFeaturesRepository;

  CaseDesignFeaturesController(this._caseDesignFeaturesRepository);

  Future<List<CaseDesignFeatures>> getList() async {
    return _caseDesignFeaturesRepository.getAllData();
  }

  Future<CaseDesignFeatures?> getDataById(int? id) async {
    return _caseDesignFeaturesRepository.getDataById(id);
  }

  Future<void> updateData(CaseDesignFeatures data) async {
    await _caseDesignFeaturesRepository.updateData(data);
  }

  Future<CaseDesignFeatures?> postData(CaseDesignFeatures data) async {
    await _caseDesignFeaturesRepository.postData(data);

    return getDataById(data.id);
  }

  Future<void> delete(int id) async {
    await _caseDesignFeaturesRepository.deleteData(id);
  }
}
