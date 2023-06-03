import 'dart:convert' as convert;

import 'package:buildpc/constant.dart';
import 'package:buildpc/model/ram/ram.dart';
import 'package:buildpc/repository/repository.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RamRepository implements Repository<Ram> {
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
      Uri.http(apiPath, '/api/admin/ram/$id'),
      headers: header,
    );
  }

  @override
  Future<List<Ram>> getAllData() async {
    List<Ram> ram = [];
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/ram'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData = convert.jsonDecode(response.body) as List<dynamic>;

      final data =
          jsonData.map((value) => value as Map<String, dynamic>).toList();

      ram = data.map((e) => Ram.fromJson(e)).toList();
    }

    return ram;
  }

  @override
  Future<Ram?> getDataById(int? id) async {
    Ram? ram;
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/ram/$id'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      ram = Ram.fromJson(jsonData);
    }

    return ram;
  }

  @override
  Future<void> postData(Ram ram) async {
    try {
      final jsonData = ram.toJson();
      final header = {
        'Content-type': 'application/json',
      };
      await http.post(
        Uri.http(apiPath, '/api/admin/ram'),
        headers: header,
        body: convert.jsonEncode(jsonData),
      );
    } catch (ex) {
      rethrow;
    }
  }

  @override
  Future<void> updateData(Ram ram) async {
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final jsonData = ram.toJson();
    await http.patch(
      Uri.http(
        apiPath,
        '/api/admin/ram/${ram.id}',
      ),
      body: convert.jsonEncode(jsonData),
      headers: header,
    );
  }
}
