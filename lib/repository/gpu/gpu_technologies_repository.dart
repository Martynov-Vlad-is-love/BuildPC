import 'dart:convert' as convert;

import 'package:buildpc/constant.dart';
import 'package:buildpc/model/gpu/gpu_technologies.dart';
import 'package:buildpc/repository/repository.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GpuTechnologiesRepository implements Repository<GPUTechnologies> {
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
      Uri.http(apiPath, '/api/admin/gpuTechnologies/$id'),
      headers: header,
    );
  }

  @override
  Future<List<GPUTechnologies>> getAllData() async {
    List<GPUTechnologies> gpuTechnologies = [];
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/gpuTechnologies'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData = convert.jsonDecode(response.body) as List<dynamic>;

      final data =
          jsonData.map((value) => value as Map<String, dynamic>).toList();

      gpuTechnologies = data.map((e) => GPUTechnologies.fromJson(e)).toList();
    }

    return gpuTechnologies;
  }

  @override
  Future<GPUTechnologies?> getDataById(int? id) async {
    GPUTechnologies? gpuTechnologies;
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/gpuTechnologies/$id'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      gpuTechnologies = GPUTechnologies.fromJson(jsonData);
    }

    return gpuTechnologies;
  }

  @override
  Future<void> postData(GPUTechnologies gpuTechnologies) async {
    final token = await _getToken();
    try {
      final jsonData = gpuTechnologies.toJson();
      final header = {
        'Content-type': 'application/json',
        'Authorization': 'Bearer $token',
        'Access-Control-Allow-Origin': '*',
        'Accept': '*/*',
      };
      await http.post(
        Uri.http(apiPath, '/api/admin/gpuTechnologies'),
        headers: header,
        body: convert.jsonEncode(jsonData),
      );
    } catch (ex) {
      rethrow;
    }
  }

  @override
  Future<void> updateData(GPUTechnologies gpuTechnologies) async {
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final jsonData = gpuTechnologies.toJson();
    await http.put(
      Uri.http(
        apiPath,
        '/api/admin/gpuTechnologies/${gpuTechnologies.id}',
      ),
      body: convert.jsonEncode(jsonData),
      headers: header,
    );
  }
}
