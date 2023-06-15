import 'dart:convert' as convert;

import 'package:buildpc/constant.dart';
import 'package:buildpc/model/motherboard/motherboard.dart';
import 'package:buildpc/repository/repository.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MotherboardRepository implements Repository<Motherboard> {
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
      Uri.http(apiPath, '/api/admin/motherboard/$id'),
      headers: header,
    );
  }

  @override
  Future<List<Motherboard>> getAllData() async {
    List<Motherboard> motherboard = [];
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/motherboard'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData = convert.jsonDecode(response.body) as List<dynamic>;

      final data =
          jsonData.map((value) => value as Map<String, dynamic>).toList();

      motherboard = data.map((e) => Motherboard.fromJson(e)).toList();
    }

    return motherboard;
  }

  @override
  Future<Motherboard?> getDataById(int? id) async {
    Motherboard? motherboard;
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/motherboard/$id'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      motherboard = Motherboard.fromJson(jsonData);
    }

    return motherboard;
  }

  @override
  Future<void> postData(Motherboard motherboard) async {
    final token = await _getToken();
    try {
      final jsonData = motherboard.toJson();
      final header = {
        'Content-type': 'application/json',
        'Authorization': 'Bearer $token',
        'Access-Control-Allow-Origin': '*',
        'Accept': '*/*',
      };
      final response = await http.post(
        Uri.http(apiPath, '/api/admin/motherboard'),
        headers: header,
        body: convert.jsonEncode(jsonData),
      );
      print(response.statusCode);
    } catch (ex) {
      rethrow;
    }
  }

  @override
  Future<void> updateData(Motherboard motherboard) async {
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final jsonData = motherboard.toJson();
    await http.put(
      Uri.http(
        apiPath,
        '/api/admin/motherboard/${motherboard.id}',
      ),
      body: convert.jsonEncode(jsonData),
      headers: header,
    );
  }
}
