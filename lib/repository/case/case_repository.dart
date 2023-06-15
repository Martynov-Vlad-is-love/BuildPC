
import 'dart:convert' as convert;

import 'package:buildpc/constant.dart';
import 'package:buildpc/model/case/case.dart';
import 'package:buildpc/repository/repository.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CaseRepository implements Repository<Case> {
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
      Uri.http(apiPath, '/api/admin/case/$id'),
      headers: header,
    );
  }

  @override
  Future<List<Case>> getAllData() async {
    List<Case> pcCase = [];
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/case'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData = convert.jsonDecode(response.body) as List<dynamic>;

      final data =
          jsonData.map((value) => value as Map<String, dynamic>).toList();

      pcCase = data.map((e) => Case.fromJson(e)).toList();
    }

    return pcCase;
  }

  @override
  Future<Case?> getDataById(int? id) async {
    Case? pcCase;
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/case/$id'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      pcCase = Case.fromJson(jsonData);
    }

    return pcCase;
  }

  @override
  Future<void> postData(Case pcCase) async {
    final token = await _getToken();
    try {
      final jsonData = pcCase.toJson();
      final header = {
        'Content-type': 'application/json',
        'Authorization': 'Bearer $token',
        'Access-Control-Allow-Origin': '*',
        'Accept': '*/*',
      };
      final response = await http.post(
        Uri.http(apiPath, '/api/admin/case'),
        headers: header,
        body: convert.jsonEncode(jsonData),
      );
      print(response.statusCode);
    } catch (ex) {
      rethrow;
    }
  }

  @override
  Future<void> updateData(Case pcCase) async {
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final jsonData = pcCase.toJson();
    await http.put(
      Uri.http(
        apiPath,
        '/api/admin/case/${pcCase.id}',
      ),
      body: convert.jsonEncode(jsonData),
      headers: header,
    );
  }
}
