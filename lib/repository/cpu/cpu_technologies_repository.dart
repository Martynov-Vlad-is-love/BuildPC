import 'dart:convert' as convert;

import 'package:buildpc/constant.dart';
import 'package:buildpc/model/cpu/cpu_technologies.dart';
import 'package:buildpc/repository/repository.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CpuTechnologiesRepository implements Repository<CPUTechnologies> {
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
      Uri.http(apiPath, '/api/admin/cpuTechnologies/$id'),
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
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/cpuTechnologies'),
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
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/cpuTechnologies/$id'),
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
    try {
      final jsonData = cpuTechnologies.toJson();
      final header = {
        'Content-type': 'application/json',
      };
      await http.post(
        Uri.http(apiPath, '/api/admin/cpuTechnologies'),
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
    };

    final jsonData = cpuTechnologies.toJson();
    await http.patch(
      Uri.http(
        apiPath,
        '/api/admin/cpuTechnologies/${cpuTechnologies.id}',
      ),
      body: convert.jsonEncode(jsonData),
      headers: header,
    );
  }
}
