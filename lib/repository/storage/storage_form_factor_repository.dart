import 'dart:convert' as convert;

import 'package:buildpc/constant.dart';
import 'package:buildpc/model/storage/storage_form_factor.dart';
import 'package:buildpc/repository/repository.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class StorageFormFactorRepository implements Repository<StorageFormFactor> {
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
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    await http.delete(
      Uri.http(apiPath, '/api/admin/storageFormFactor/$id'),
      headers: header,
    );
  }

  @override
  Future<List<StorageFormFactor>> getAllData() async {
    List<StorageFormFactor> storageFormFactor = [];
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final response = await http
        .get(Uri.http(apiPath, '/api/all/storageFormFactor'), headers: header);

    if (response.statusCode == 200) {
      final jsonData = convert.jsonDecode(response.body) as List<dynamic>;

      final data =
          jsonData.map((value) => value as Map<String, dynamic>).toList();

      storageFormFactor =
          data.map((e) => StorageFormFactor.fromJson(e)).toList();
    }

    return storageFormFactor;
  }

  @override
  Future<StorageFormFactor?> getDataById(int? id) async {
    StorageFormFactor? storageFormFactor;
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/storageFormFactor/$id'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      storageFormFactor = StorageFormFactor.fromJson(jsonData);
    }

    return storageFormFactor;
  }

  @override
  Future<void> postData(StorageFormFactor storageFormFactor) async {
    final token = await _getToken();
    try {
      final jsonData = storageFormFactor.toJson();
      final header = {
        'Content-type': 'application/json',
        'Authorization': 'Bearer $token',
        'Access-Control-Allow-Origin': '*',
        'Accept': '*/*',
      };
      await http.post(
        Uri.http(apiPath, '/api/admin/storageFormFactor'),
        headers: header,
        body: convert.jsonEncode(jsonData),
      );
    } catch (ex) {
      rethrow;
    }
  }

  @override
  Future<void> updateData(StorageFormFactor storageFormFactor) async {
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final jsonData = storageFormFactor.toJson();
    await http.put(
      Uri.http(
        apiPath,
        '/api/admin/storageFormFactor/${storageFormFactor.id}',
      ),
      body: convert.jsonEncode(jsonData),
      headers: header,
    );
  }
}
