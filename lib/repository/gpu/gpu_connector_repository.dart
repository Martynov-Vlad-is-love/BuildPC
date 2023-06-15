import 'dart:convert' as convert;

import 'package:buildpc/constant.dart';
import 'package:buildpc/model/gpu/gpu_connector.dart';
import 'package:buildpc/repository/repository.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GpuConnectorRepository implements Repository<GPUConnector> {
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
      Uri.http(apiPath, '/api/admin/gpuConnector/$id'),
      headers: header,
    );
  }

  @override
  Future<List<GPUConnector>> getAllData() async {
    List<GPUConnector> gpuConnector = [];
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/gpuConnector'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData = convert.jsonDecode(response.body) as List<dynamic>;

      final data =
          jsonData.map((value) => value as Map<String, dynamic>).toList();

      gpuConnector = data.map((e) => GPUConnector.fromJson(e)).toList();
    }

    return gpuConnector;
  }

  @override
  Future<GPUConnector?> getDataById(int? id) async {
    GPUConnector? gpuConnector;
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/gpuConnector/$id'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      gpuConnector = GPUConnector.fromJson(jsonData);
    }

    return gpuConnector;
  }

  @override
  Future<void> postData(GPUConnector gpuConnector) async {
    final token = await _getToken();

    try {
      final jsonData = gpuConnector.toJson();
      final header = {
        'Content-type': 'application/json',
        'Authorization': 'Bearer $token',
        'Access-Control-Allow-Origin': '*',
        'Accept': '*/*',
      };
      await http.post(
        Uri.http(apiPath, '/api/admin/gpuConnector'),
        headers: header,
        body: convert.jsonEncode(jsonData),
      );
    } catch (ex) {
      rethrow;
    }
  }

  @override
  Future<void> updateData(GPUConnector gpuConnector) async {
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final jsonData = gpuConnector.toJson();
    await http.put(
      Uri.http(
        apiPath,
        '/api/admin/gpuConnector/${gpuConnector.id}',
      ),
      body: convert.jsonEncode(jsonData),
      headers: header,
    );
  }
}
