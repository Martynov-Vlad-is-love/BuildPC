import 'dart:convert' as convert;

import 'package:buildpc/constant.dart';
import 'package:buildpc/model/ram/ram_memory_type.dart';
import 'package:buildpc/repository/repository.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RamMemoryTypeRepository implements Repository<RamMemoryType> {
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
      Uri.http(apiPath, '/api/admin/ramMemoryType/$id'),
      headers: header,
    );
  }

  @override
  Future<List<RamMemoryType>> getAllData() async {
    List<RamMemoryType> ramMemoryType = [];
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/ramMemoryType'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData = convert.jsonDecode(response.body) as List<dynamic>;

      final data =
          jsonData.map((value) => value as Map<String, dynamic>).toList();

      ramMemoryType = data.map((e) => RamMemoryType.fromJson(e)).toList();
    }

    return ramMemoryType;
  }

  @override
  Future<RamMemoryType?> getDataById(int? id) async {
    RamMemoryType? ramMemoryType;
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/ramMemoryType/$id'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      ramMemoryType = RamMemoryType.fromJson(jsonData);
    }

    return ramMemoryType;
  }

  @override
  Future<void> postData(RamMemoryType ramMemoryType) async {
    try {
      final jsonData = ramMemoryType.toJson();
      final header = {
        'Content-type': 'application/json',
      };
      await http.post(
        Uri.http(apiPath, '/api/admin/ramMemoryType'),
        headers: header,
        body: convert.jsonEncode(jsonData),
      );
    } catch (ex) {
      rethrow;
    }
  }

  @override
  Future<void> updateData(RamMemoryType ramMemoryType) async {
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final jsonData = ramMemoryType.toJson();
    await http.patch(
      Uri.http(
        apiPath,
        '/api/admin/ramMemoryType/${ramMemoryType.id}',
      ),
      body: convert.jsonEncode(jsonData),
      headers: header,
    );
  }
}
