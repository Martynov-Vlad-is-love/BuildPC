import 'dart:convert' as convert;

import 'package:buildpc/constant.dart';
import 'package:buildpc/model/general/performance_level.dart';
import 'package:buildpc/repository/repository.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PerformanceLevelRepository implements Repository<PerformanceLevel> {
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
      Uri.http(apiPath, '/api/admin/performanceLevel/$id'),
      headers: header,
    );
  }

  @override
  Future<List<PerformanceLevel>> getAllData() async {
    List<PerformanceLevel> performanceLevel = [];
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final response = await http
        .get(Uri.http(apiPath, '/api/all/performanceLevel'), headers: header);

    if (response.statusCode == 200) {
      final jsonData = convert.jsonDecode(response.body) as List<dynamic>;

      final data =
          jsonData.map((value) => value as Map<String, dynamic>).toList();

      performanceLevel = data.map((e) => PerformanceLevel.fromJson(e)).toList();
    }

    return performanceLevel;
  }

  @override
  Future<PerformanceLevel?> getDataById(int? id) async {
    PerformanceLevel? performanceLevel;
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/performanceLevel/$id'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      performanceLevel = PerformanceLevel.fromJson(jsonData);
    }

    return performanceLevel;
  }

  @override
  Future<void> postData(PerformanceLevel performanceLevel) async {
    final token = await _getToken();
    try {
      final jsonData = performanceLevel.toJson();
      final header = {
        'Content-type': 'application/json',
        'Authorization': 'Bearer $token',
        'Access-Control-Allow-Origin': '*',
        'Accept': '*/*',
      };
      await http.post(
        Uri.http(apiPath, '/api/admin/performanceLevel'),
        headers: header,
        body: convert.jsonEncode(jsonData),
      );
    } catch (ex) {
      rethrow;
    }
  }

  @override
  Future<void> updateData(PerformanceLevel performanceLevel) async {
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final jsonData = performanceLevel.toJson();
    await http.put(
      Uri.http(apiPath,
          '/api/admin/performanceLevel/${performanceLevel.id}',),
      body: convert.jsonEncode(jsonData),
      headers: header,
    );
  }
}
