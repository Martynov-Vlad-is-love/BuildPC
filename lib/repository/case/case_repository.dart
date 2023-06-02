import 'package:buildpc/model/case/case.dart';
import 'package:buildpc/repository/repository.dart';

class CaseRepository implements Repository<Case>{
  @override
  Future<void> deleteData(int id) {
    // TODO: implement deleteData
    throw UnimplementedError();
  }

  @override
  Future<List<Case>> getAllData() {
    // TODO: implement getAllData
    throw UnimplementedError();
  }

  @override
  Future<Case> getDataById(int? id) {
    // TODO: implement getDataById
    throw UnimplementedError();
  }

  @override
  Future<void> postData(Case type) async {
    // TODO: implement postData
    throw UnimplementedError();
  }

  @override
  Future<void> updateData(Case type) {
    // TODO: implement updateData
    throw UnimplementedError();
  }
}
