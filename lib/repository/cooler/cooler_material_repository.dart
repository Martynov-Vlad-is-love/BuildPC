import 'dart:convert' as convert;

import 'package:buildpc/constant.dart';
import 'package:buildpc/model/cooler/cooler_material.dart';
import 'package:buildpc/repository/repository.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CoolerMaterialRepository implements Repository<CoolerMaterial> {
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
      Uri.http(apiPath, '/api/admin/coolerMaterial/$id'),
      headers: header,
    );
  }

  @override
  Future<List<CoolerMaterial>> getAllData() async {
    List<CoolerMaterial> coolerMaterial = [];
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final response = await http
        .get(Uri.http(apiPath, '/api/all/coolerMaterial'), headers: header);

    if (response.statusCode == 200) {
      final jsonData = convert.jsonDecode(response.body) as List<dynamic>;

      final data =
          jsonData.map((value) => value as Map<String, dynamic>).toList();

      coolerMaterial = data.map((e) => CoolerMaterial.fromJson(e)).toList();
    }

    return coolerMaterial;
  }

  @override
  Future<CoolerMaterial?> getDataById(int? id) async {
    CoolerMaterial? coolerMaterial;
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/coolerMaterial/$id'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      coolerMaterial = CoolerMaterial.fromJson(jsonData);
    }

    return coolerMaterial;
  }

  @override
  Future<void> postData(CoolerMaterial coolerMaterial) async {
    final token = await _getToken();
    try {
      final jsonData = coolerMaterial.toJson();
      final header = {
        'Content-type': 'application/json',
        'Authorization': 'Bearer $token',
        'Access-Control-Allow-Origin': '*',
        'Accept': '*/*',
      };
      await http.post(
        Uri.http(apiPath, '/api/admin/coolerMaterial'),
        headers: header,
        body: convert.jsonEncode(jsonData),
      );
    } catch (ex) {
      rethrow;
    }
  }

  @override
  Future<void> updateData(CoolerMaterial coolerMaterial) async {
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final jsonData = coolerMaterial.toJson();
    await http.put(
      Uri.http(
        apiPath,
        '/api/admin/coolerMaterial/${coolerMaterial.id}',
      ),
      body: convert.jsonEncode(jsonData),
      headers: header,
    );
  }
}
