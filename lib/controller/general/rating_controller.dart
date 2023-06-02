import 'package:buildpc/model/general/rating.dart';
import 'package:buildpc/repository/general/rating_repository.dart';

class RatingController {
  final RatingRepository _ratingRepository;

  RatingController(this._ratingRepository);

  Future<List<Rating>> getList() async {
    return _ratingRepository.getAllData();
  }

  Future<Rating?> getDataById(int? id) async {
    return _ratingRepository.getDataById(id);
  }

  Future<void> updateData(Rating data) async {
    await _ratingRepository.updateData(data);
  }

  Future<Rating?> postData(Rating data) async {
    await _ratingRepository.postData(data);

    return getDataById(data.id);
  }

  Future<void> delete(int id) async {
    await _ratingRepository.deleteData(id);
  }
}
