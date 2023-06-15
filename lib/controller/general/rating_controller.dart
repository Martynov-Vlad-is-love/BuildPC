import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/general/rating.dart';
import 'package:buildpc/repository/general/rating_repository.dart';
import 'package:flutter/cupertino.dart';

class RatingController extends ChangeNotifier
    implements ModelControllerAbstract<Rating> {
  final RatingRepository _ratingRepository;

  RatingController(this._ratingRepository);

  @override
  Future<List<Rating>> getList() async {
    final result = _ratingRepository.getAllData();
    notifyListeners();

    return result;
  }

  @override
  Future<Rating?> getDataById(int? id) async {
    final result = _ratingRepository.getDataById(id);
    notifyListeners();

    return result;
  }

  @override
  Future<void> updateData(Rating data) async {
    await _ratingRepository.updateData(data);
    notifyListeners();
  }

  @override
  Future<void> postData(Rating data) async {
    await _ratingRepository.postData(data);
    notifyListeners();
  }

  @override
  Future<void> delete(int id) async {
    await _ratingRepository.deleteData(id);
    notifyListeners();
  }
}
