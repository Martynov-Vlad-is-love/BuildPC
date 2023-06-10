abstract class ModelControllerAbstract<T>{
  Future<List<T>> getList();

  Future<T?> getDataById(int? id);

  Future<void> updateData(T data);

  Future<void> postData(T data);

  Future<void> delete(int id);
}
