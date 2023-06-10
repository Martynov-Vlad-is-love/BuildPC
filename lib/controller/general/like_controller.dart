import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/general/like.dart';
import 'package:buildpc/repository/general/like_repository.dart';

class LikeController implements ModelControllerAbstract<Like>{
  final LikeRepository _likeRepository;

  LikeController(this._likeRepository);

  @override
  Future<List<Like>> getList() async {
    return _likeRepository.getAllData();
  }

  @override
  Future<Like?> getDataById(int? id) async {
    return _likeRepository.getDataById(id);
  }

  @override
  Future<void> updateData(Like data) async {
    await _likeRepository.updateData(data);
  }

  @override
  Future<void> postData(Like data) async {
    await _likeRepository.postData(data);
  }

  @override
  Future<void> delete(int id) async {
    await _likeRepository.deleteData(id);
  }
}
