import 'package:buildpc/model/gpu/graphic_card.dart';
import 'package:buildpc/repository/gpu/graphic_card_repository.dart';

class GraphicCardController {
  final GraphicCardRepository _graphicCardRepository;

  GraphicCardController(this._graphicCardRepository);

  Future<List<GraphicCard>> getList() async {
    return _graphicCardRepository.getAllData();
  }

  Future<GraphicCard?> getDataById(int? id) async {
    return _graphicCardRepository.getDataById(id);
  }

  Future<void> updateData(GraphicCard data) async {
    await _graphicCardRepository.updateData(data);
  }

  Future<GraphicCard?> postData(GraphicCard data) async {
    await _graphicCardRepository.postData(data);

    return getDataById(data.id);
  }

  Future<void> delete(int id) async {
    await _graphicCardRepository.deleteData(id);
  }
}
