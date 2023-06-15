import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/gpu/graphic_card.dart';
import 'package:buildpc/repository/gpu/graphic_card_repository.dart';
import 'package:flutter/cupertino.dart';

class GraphicCardController extends ChangeNotifier
    implements ModelControllerAbstract<GraphicCard> {
  final GraphicCardRepository _graphicCardRepository;

  GraphicCardController(this._graphicCardRepository);

  @override
  Future<List<GraphicCard>> getList() async {
    final result = _graphicCardRepository.getAllData();
    notifyListeners();

    return result;
  }

  @override
  Future<GraphicCard?> getDataById(int? id) async {
    final result = _graphicCardRepository.getDataById(id);
    notifyListeners();

    return result;
  }

  @override
  Future<void> updateData(GraphicCard data) async {
    await _graphicCardRepository.updateData(data);
    notifyListeners();
  }

  @override
  Future<void> postData(GraphicCard data) async {
    await _graphicCardRepository.postData(data);
    notifyListeners();
  }

  @override
  Future<void> delete(int id) async {
    await _graphicCardRepository.deleteData(id);
    notifyListeners();
  }
}
