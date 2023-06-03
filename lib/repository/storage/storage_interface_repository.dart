import 'dart:convert' as convert;

import 'package:buildpc/constant.dart';
import 'package:buildpc/model/storage/storage_interface.dart';
import 'package:buildpc/repository/repository.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class StorageInterfaceRepository implements Repository<StorageInterface> {
  final path = 'Producer';
  final header = {
    'Content-type': 'application/json',
  };

  Future<String?> _getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString('token');
  }

  @override
  Future<void> deleteData(int id) async {
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    await http.delete(
      Uri.http(apiPath, '/api/admin/storageInterface/$id'),
      headers: header,
    );
  }

  @override
  Future<List<StorageInterface>> getAllData() async {
    List<StorageInterface> storageInterface = [];
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final response = await http
        .get(Uri.http(apiPath, '/api/all/storageInterface'), headers: header);

    if (response.statusCode == 200) {
      final jsonData = convert.jsonDecode(response.body) as List<dynamic>;

      final data =
          jsonData.map((value) => value as Map<String, dynamic>).toList();

      storageInterface = data.map((e) => StorageInterface.fromJson(e)).toList();
    }

    return storageInterface;
  }

  @override
  Future<StorageInterface?> getDataById(int? id) async {
    StorageInterface? storageInterface;
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/storageInterface/$id'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      storageInterface = StorageInterface.fromJson(jsonData);
    }

    return storageInterface;
  }

  @override
  Future<void> postData(StorageInterface storageInterface) async {
    try {
      final jsonData = storageInterface.toJson();
      final header = {
        'Content-type': 'application/json',
      };
      await http.post(
        Uri.http(apiPath, '/api/admin/storageInterface'),
        headers: header,
        body: convert.jsonEncode(jsonData),
      );
    } catch (ex) {
      rethrow;
    }
  }

  @override
  Future<void> updateData(StorageInterface storageInterface) async {
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final jsonData = storageInterface.toJson();
    await http.patch(
      Uri.http(
        apiPath,
        '/api/admin/storageInterface/${storageInterface.id}',
      ),
      body: convert.jsonEncode(jsonData),
      headers: header,
    );
  }
}
