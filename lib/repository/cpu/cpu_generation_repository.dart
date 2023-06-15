import 'dart:convert' as convert;

import 'package:buildpc/constant.dart';
import 'package:buildpc/model/cpu/cpu_generation.dart';
import 'package:buildpc/repository/repository.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CpuGenerationRepository implements Repository<CPUGeneration> {
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
      Uri.http(apiPath, '/api/admin/cpuGeneration/$id'),
      headers: header,
    );
  }

  @override
  Future<List<CPUGeneration>> getAllData() async {
    List<CPUGeneration> cpuGeneration = [];
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/cpuGeneration'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData = convert.jsonDecode(response.body) as List<dynamic>;

      final data =
          jsonData.map((value) => value as Map<String, dynamic>).toList();

      cpuGeneration = data.map((e) => CPUGeneration.fromJson(e)).toList();
    }

    return cpuGeneration;
  }

  @override
  Future<CPUGeneration?> getDataById(int? id) async {
    CPUGeneration? cpuGeneration;
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/cpuGeneration/$id'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      cpuGeneration = CPUGeneration.fromJson(jsonData);
    }

    return cpuGeneration;
  }

  @override
  Future<void> postData(CPUGeneration cpuGeneration) async {
    final token = await _getToken();

    try {
      final jsonData = cpuGeneration.toJson();
      final header = {
        'Content-type': 'application/json',
        'Authorization': 'Bearer $token',
        'Access-Control-Allow-Origin': '*',
        'Accept': '*/*',
      };
      await http.post(
        Uri.http(apiPath, '/api/admin/cpuGeneration'),
        headers: header,
        body: convert.jsonEncode(jsonData),
      );
    } catch (ex) {
      rethrow;
    }
  }

  @override
  Future<void> updateData(CPUGeneration cpuGeneration) async {
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final jsonData = cpuGeneration.toJson();
    await http.put(
      Uri.http(
        apiPath,
        '/api/admin/cpuGeneration/${cpuGeneration.id}',
      ),
      body: convert.jsonEncode(jsonData),
      headers: header,
    );
  }
}
