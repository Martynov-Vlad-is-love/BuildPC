import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/general/like.dart';
import 'package:buildpc/repository/general/like_repository.dart';
import 'package:flutter/cupertino.dart';

class LikeController extends ChangeNotifier
    implements ModelControllerAbstract<Like> {
  final LikeRepository _likeRepository;

  LikeController(this._likeRepository);

  @override
  Future<List<Like>> getList() async {
    final result = _likeRepository.getAllData();
    notifyListeners();

    return result;
  }

  @override
  Future<Like?> getDataById(int? id) async {
    final result = _likeRepository.getDataById(id);
    notifyListeners();

    return result;
  }

  @override
  Future<void> updateData(Like data) async {
    await _likeRepository.updateData(data);
    notifyListeners();
  }

  @override
  Future<void> postData(Like data) async {
    await _likeRepository.postData(data);
    notifyListeners();
  }

  @override
  Future<void> delete(int id) async {
    await _likeRepository.deleteData(id);
    notifyListeners();
  }
}
