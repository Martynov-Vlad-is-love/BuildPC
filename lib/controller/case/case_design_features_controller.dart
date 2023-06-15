import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/case/case_design_features.dart';
import 'package:buildpc/repository/case/case_design_features_repository.dart';
import 'package:flutter/cupertino.dart';

class CaseDesignFeaturesController extends ChangeNotifier
    implements ModelControllerAbstract<CaseDesignFeatures> {
  final CaseDesignFeaturesRepository _caseDesignFeaturesRepository;

  CaseDesignFeaturesController(this._caseDesignFeaturesRepository);

  @override
  Future<List<CaseDesignFeatures>> getList() async {
    final result = await _caseDesignFeaturesRepository.getAllData();
    notifyListeners();

    return result;
  }

  @override
  Future<CaseDesignFeatures?> getDataById(int? id) async {
    final result = await _caseDesignFeaturesRepository.getDataById(id);
    notifyListeners();

    return result;
  }

  @override
  Future<void> updateData(CaseDesignFeatures data) async {
    await _caseDesignFeaturesRepository.updateData(data);
    notifyListeners();
  }

  @override
  Future<void> postData(CaseDesignFeatures data) async {
    await _caseDesignFeaturesRepository.postData(data);
    notifyListeners();
  }

  @override
  Future<void> delete(int id) async {
    await _caseDesignFeaturesRepository.deleteData(id);
    notifyListeners();
  }
}
