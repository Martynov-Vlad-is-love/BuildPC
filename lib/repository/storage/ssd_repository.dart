import 'dart:convert' as convert;

import 'package:buildpc/constant.dart';
import 'package:buildpc/model/storage/ssd.dart';
import 'package:buildpc/repository/repository.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SsdRepository implements Repository<Ssd> {
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
      Uri.http(apiPath, '/api/admin/ssd/$id'),
      headers: header,
    );
  }

  @override
  Future<List<Ssd>> getAllData() async {
    List<Ssd> ssd = [];
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/ssd'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData = convert.jsonDecode(response.body) as List<dynamic>;

      final data =
      jsonData.map((value) => value as Map<String, dynamic>).toList();

      ssd = data.map((e) => Ssd.fromJson(e)).toList();
    }

    return ssd;
  }

  @override
  Future<Ssd?> getDataById(int? id) async {
    Ssd? ssd;
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/ssd/$id'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData =
      convert.jsonDecode(response.body) as Map<String, dynamic>;

      ssd = Ssd.fromJson(jsonData);
    }

    return ssd;
  }

  @override
  Future<void> postData(Ssd ssd) async {
    final token = await _getToken();
    try {
      final jsonData = ssd.toJson();
      final header = {
        'Content-type': 'application/json',
        'Authorization': 'Bearer $token',
        'Access-Control-Allow-Origin': '*',
        'Accept': '*/*',
      };
      await http.post(
        Uri.http(apiPath, '/api/admin/ssd'),
        headers: header,
        body: convert.jsonEncode(jsonData),
      );
    } catch (ex) {
      rethrow;
    }
  }

  @override
  Future<void> updateData(Ssd ssd) async {
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final jsonData = ssd.toJson();
    await http.put(
      Uri.http(
        apiPath,
        '/api/admin/ssd/${ssd.id}',
      ),
      body: convert.jsonEncode(jsonData),
      headers: header,
    );
  }
}
