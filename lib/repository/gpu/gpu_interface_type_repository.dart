import 'dart:convert' as convert;

import 'package:buildpc/constant.dart';
import 'package:buildpc/model/gpu/gpu_interface_type.dart';
import 'package:buildpc/repository/repository.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GpuInterfaceTypeRepository implements Repository<GPUInterfaceType> {
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
      Uri.http(apiPath, '/api/admin/gpuInterfaceType/$id'),
      headers: header,
    );
  }

  @override
  Future<List<GPUInterfaceType>> getAllData() async {
    List<GPUInterfaceType> gpuInterfaceType = [];
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/gpuInterfaceType'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData = convert.jsonDecode(response.body) as List<dynamic>;

      final data =
          jsonData.map((value) => value as Map<String, dynamic>).toList();

      gpuInterfaceType = data.map((e) => GPUInterfaceType.fromJson(e)).toList();
    }

    return gpuInterfaceType;
  }

  @override
  Future<GPUInterfaceType?> getDataById(int? id) async {
    GPUInterfaceType? gpuInterfaceType;
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

      gpuInterfaceType = GPUInterfaceType.fromJson(jsonData);
    }

    return gpuInterfaceType;
  }

  @override
  Future<void> postData(GPUInterfaceType gpuInterfaceType) async {
    final token = await _getToken();
    try {
      final jsonData = gpuInterfaceType.toJson();
      final header = {
        'Content-type': 'application/json',
        'Authorization': 'Bearer $token',
        'Access-Control-Allow-Origin': '*',
        'Accept': '*/*',
      };
      await http.post(
        Uri.http(apiPath, '/api/admin/gpuInterfaceType'),
        headers: header,
        body: convert.jsonEncode(jsonData),
      );
    } catch (ex) {
      rethrow;
    }
  }

  @override
  Future<void> updateData(GPUInterfaceType gpuInterfaceType) async {
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final jsonData = gpuInterfaceType.toJson();
    await http.put(
      Uri.http(
        apiPath,
        '/api/admin/gpuInterfaceType/${gpuInterfaceType.id}',
      ),
      body: convert.jsonEncode(jsonData),
      headers: header,
    );
  }
}
