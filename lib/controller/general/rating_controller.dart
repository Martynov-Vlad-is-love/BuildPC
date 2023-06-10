import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/general/rating.dart';
import 'package:buildpc/repository/general/rating_repository.dart';

class RatingController implements ModelControllerAbstract<Rating>{
  final RatingRepository _ratingRepository;

  RatingController(this._ratingRepository);

  @override
  Future<List<Rating>> getList() async {
    return _ratingRepository.getAllData();
  }

  @override
  Future<Rating?> getDataById(int? id) async {
    return _ratingRepository.getDataById(id);
  }

  @override
  Future<void> updateData(Rating data) async {
    await _ratingRepository.updateData(data);
  }

  @override
  Future<void> postData(Rating data) async {
    await _ratingRepository.postData(data);
  }

  @override
  Future<void> delete(int id) async {
    await _ratingRepository.deleteData(id);
  }
}
