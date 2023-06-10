import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/gpu/graphic_card.dart';
import 'package:buildpc/repository/gpu/graphic_card_repository.dart';

class GraphicCardController implements ModelControllerAbstract<GraphicCard>{
  final GraphicCardRepository _graphicCardRepository;

  GraphicCardController(this._graphicCardRepository);

  @override
  Future<List<GraphicCard>> getList() async {
    return _graphicCardRepository.getAllData();
  }

  @override
  Future<GraphicCard?> getDataById(int? id) async {
    return _graphicCardRepository.getDataById(id);
  }

  @override
  Future<void> updateData(GraphicCard data) async {
    await _graphicCardRepository.updateData(data);
  }

  @override
  Future<GraphicCard?> postData(GraphicCard data) async {
    await _graphicCardRepository.postData(data);

    return getDataById(data.id);
  }

  @override
  Future<void> delete(int id) async {
    await _graphicCardRepository.deleteData(id);
  }
}
