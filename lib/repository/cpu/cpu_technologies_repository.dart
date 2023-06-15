import 'dart:convert' as convert;

import 'package:buildpc/constant.dart';
import 'package:buildpc/model/cpu/cpu_technologies.dart';
import 'package:buildpc/repository/repository.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CpuTechnologiesRepository implements Repository<CPUTechnologies> {
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
      Uri.http(apiPath, '/api/admin/cpuTech/$id'),
      headers: header,
    );
  }

  @override
  Future<List<CPUTechnologies>> getAllData() async {
    List<CPUTechnologies> cpuTechnologies = [];
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/cpuTech'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData = convert.jsonDecode(response.body) as List<dynamic>;

      final data =
          jsonData.map((value) => value as Map<String, dynamic>).toList();

      cpuTechnologies = data.map((e) => CPUTechnologies.fromJson(e)).toList();
    }

    return cpuTechnologies;
  }

  @override
  Future<CPUTechnologies?> getDataById(int? id) async {
    CPUTechnologies? cpuTechnologies;
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/cpuTech/$id'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      cpuTechnologies = CPUTechnologies.fromJson(jsonData);
    }

    return cpuTechnologies;
  }

  @override
  Future<void> postData(CPUTechnologies cpuTechnologies) async {
    final token = await _getToken();
    try {
      final jsonData = cpuTechnologies.toJson();
      final header = {
        'Content-type': 'application/json',
        'Authorization': 'Bearer $token',
        'Access-Control-Allow-Origin': '*',
        'Accept': '*/*',
      };
      await http.post(
        Uri.http(apiPath, '/api/admin/cpuTech'),
        headers: header,
        body: convert.jsonEncode(jsonData),
      );
    } catch (ex) {
      rethrow;
    }
  }

  @override
  Future<void> updateData(CPUTechnologies cpuTechnologies) async {
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final jsonData = cpuTechnologies.toJson();
    await http.put(
      Uri.http(
        apiPath,
        '/api/admin/cpuTech/${cpuTechnologies.id}',
      ),
      body: convert.jsonEncode(jsonData),
      headers: header,
    );
  }
}
