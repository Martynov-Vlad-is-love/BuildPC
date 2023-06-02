import 'package:buildpc/model/general/like.dart';
import 'package:buildpc/repository/general/like_repository.dart';

class LikeController {
  final LikeRepository _likeRepository;

  LikeController(this._likeRepository);

  Future<List<Like>> getList() async {
    return _likeRepository.getAllData();
  }

  Future<Like?> getDataById(int? id) async {
    return _likeRepository.getDataById(id);
  }

  Future<void> updateData(Like data) async {
    await _likeRepository.updateData(data);
  }

  Future<Like?> postData(Like data) async {
    await _likeRepository.postData(data);

    return getDataById(data.id);
  }

  Future<void> delete(int id) async {
    await _likeRepository.deleteData(id);
  }
}
