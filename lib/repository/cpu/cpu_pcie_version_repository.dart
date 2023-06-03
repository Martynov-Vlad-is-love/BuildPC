import 'dart:convert' as convert;

import 'package:buildpc/constant.dart';
import 'package:buildpc/model/cpu/cpu_pcie_version.dart';
import 'package:buildpc/repository/repository.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CpuPcieVersionRepository implements Repository<CPUPCIeVersion> {
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
      Uri.http(apiPath, '/api/admin/cpuPcieVersion/$id'),
      headers: header,
    );
  }

  @override
  Future<List<CPUPCIeVersion>> getAllData() async {
    List<CPUPCIeVersion> cpuPcieVersion = [];
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/cpuPcieVersion'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData = convert.jsonDecode(response.body) as List<dynamic>;

      final data =
          jsonData.map((value) => value as Map<String, dynamic>).toList();

      cpuPcieVersion = data.map((e) => CPUPCIeVersion.fromJson(e)).toList();
    }

    return cpuPcieVersion;
  }

  @override
  Future<CPUPCIeVersion?> getDataById(int? id) async {
    CPUPCIeVersion? cpuPcieVersion;
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/cpuPcieVersion/$id'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      cpuPcieVersion = CPUPCIeVersion.fromJson(jsonData);
    }

    return cpuPcieVersion;
  }

  @override
  Future<void> postData(CPUPCIeVersion cpuPcieVersion) async {
    try {
      final jsonData = cpuPcieVersion.toJson();
      final header = {
        'Content-type': 'application/json',
      };
      await http.post(
        Uri.http(apiPath, '/api/admin/cpuPcieVersion'),
        headers: header,
        body: convert.jsonEncode(jsonData),
      );
    } catch (ex) {
      rethrow;
    }
  }

  @override
  Future<void> updateData(CPUPCIeVersion cpuPcieVersion) async {
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final jsonData = cpuPcieVersion.toJson();
    await http.patch(
      Uri.http(
        apiPath,
        '/api/admin/cpuPcieVersion/${cpuPcieVersion.id}',
      ),
      body: convert.jsonEncode(jsonData),
      headers: header,
    );
  }
}
