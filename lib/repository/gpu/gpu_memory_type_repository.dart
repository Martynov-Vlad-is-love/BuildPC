import 'dart:convert' as convert;

import 'package:buildpc/constant.dart';
import 'package:buildpc/model/gpu/gpu_memory_type.dart';
import 'package:buildpc/repository/repository.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GpuMemoryTypeRepository implements Repository<GPUMemoryType> {
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
      Uri.http(apiPath, '/api/admin/gpuMemoryType/$id'),
      headers: header,
    );
  }

  @override
  Future<List<GPUMemoryType>> getAllData() async {
    List<GPUMemoryType> gpuMemoryType = [];
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/gpuMemoryType'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData = convert.jsonDecode(response.body) as List<dynamic>;

      final data =
          jsonData.map((value) => value as Map<String, dynamic>).toList();

      gpuMemoryType = data.map((e) => GPUMemoryType.fromJson(e)).toList();
    }

    return gpuMemoryType;
  }

  @override
  Future<GPUMemoryType?> getDataById(int? id) async {
    GPUMemoryType? gpuMemoryType;
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/gpuInterfaceType/$id'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      gpuMemoryType = GPUMemoryType.fromJson(jsonData);
    }

    return gpuMemoryType;
  }

  @override
  Future<void> postData(GPUMemoryType gpuMemoryType) async {
    final token = await _getToken();
    try {
      final jsonData = gpuMemoryType.toJson();
      final header = {
        'Content-type': 'application/json',
        'Authorization': 'Bearer $token',
        'Access-Control-Allow-Origin': '*',
        'Accept': '*/*',
      };
      await http.post(
        Uri.http(apiPath, '/api/admin/gpuMemoryType'),
        headers: header,
        body: convert.jsonEncode(jsonData),
      );
    } catch (ex) {
      rethrow;
    }
  }

  @override
  Future<void> updateData(GPUMemoryType gpuMemoryType) async {
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final jsonData = gpuMemoryType.toJson();
    await http.put(
      Uri.http(
        apiPath,
        '/api/admin/gpuMemoryType/${gpuMemoryType.id}',
      ),
      body: convert.jsonEncode(jsonData),
      headers: header,
    );
  }
}
