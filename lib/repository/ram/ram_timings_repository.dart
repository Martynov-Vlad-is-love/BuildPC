import 'dart:convert' as convert;

import 'package:buildpc/constant.dart';
import 'package:buildpc/model/ram/ram_timings.dart';
import 'package:buildpc/repository/repository.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RamTimingsRepository implements Repository<RamTimings> {
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
      Uri.http(apiPath, '/api/admin/ramTimings/$id'),
      headers: header,
    );
  }

  @override
  Future<List<RamTimings>> getAllData() async {
    List<RamTimings> ramTimings = [];
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/ramTimings'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData = convert.jsonDecode(response.body) as List<dynamic>;

      final data =
          jsonData.map((value) => value as Map<String, dynamic>).toList();

      ramTimings = data.map((e) => RamTimings.fromJson(e)).toList();
    }

    return ramTimings;
  }

  @override
  Future<RamTimings?> getDataById(int? id) async {
    RamTimings? ramTimings;
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/ramTimings/$id'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      ramTimings = RamTimings.fromJson(jsonData);
    }

    return ramTimings;
  }

  @override
  Future<void> postData(RamTimings ramTimings) async {
    try {
      final jsonData = ramTimings.toJson();
      final header = {
        'Content-type': 'application/json',
      };
      await http.post(
        Uri.http(apiPath, '/api/admin/ramTimings'),
        headers: header,
        body: convert.jsonEncode(jsonData),
      );
    } catch (ex) {
      rethrow;
    }
  }

  @override
  Future<void> updateData(RamTimings ramTimings) async {
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final jsonData = ramTimings.toJson();
    await http.patch(
      Uri.http(
        apiPath,
        '/api/admin/ramTimings/${ramTimings.id}',
      ),
      body: convert.jsonEncode(jsonData),
      headers: header,
    );
  }
}
