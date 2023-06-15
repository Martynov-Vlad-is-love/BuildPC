import 'dart:convert' as convert;

import 'package:buildpc/constant.dart';
import 'package:buildpc/model/cooler/cooler.dart';
import 'package:buildpc/repository/repository.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CoolerRepository implements Repository<Cooler> {
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
      Uri.http(apiPath, '/api/admin/cooler/$id'),
      headers: header,
    );
  }

  @override
  Future<List<Cooler>> getAllData() async {
    List<Cooler> cooler = [];
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final response =
        await http.get(Uri.http(apiPath, '/api/all/cooler'), headers: header);

    if (response.statusCode == 200) {
      final jsonData = convert.jsonDecode(response.body) as List<dynamic>;

      final data =
          jsonData.map((value) => value as Map<String, dynamic>).toList();

      cooler = data.map((e) => Cooler.fromJson(e)).toList();
    }

    return cooler;
  }

  @override
  Future<Cooler?> getDataById(int? id) async {
    Cooler? cooler;
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/cooler/$id'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      cooler = Cooler.fromJson(jsonData);
    }

    return cooler;
  }

  @override
  Future<void> postData(Cooler cooler) async {
    final token = await _getToken();
    try {
      final jsonData = cooler.toJson();
      final header = {
        'Content-type': 'application/json',
        'Authorization': 'Bearer $token',
        'Access-Control-Allow-Origin': '*',
        'Accept': '*/*',
      };
      final response = await http.post(
        Uri.http(apiPath, '/api/admin/cooler'),
        headers: header,
        body: convert.jsonEncode(jsonData),
      );
      print(response.statusCode);
    } catch (ex) {
      rethrow;
    }
  }

  @override
  Future<void> updateData(Cooler cooler) async {
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final jsonData = cooler.toJson();
    final response = await http.put(
      Uri.http(
        apiPath,
        '/api/admin/cooler/${cooler.id}',
      ),
      body: convert.jsonEncode(jsonData),
      headers: header,
    );
    print(response.statusCode);
  }
}
