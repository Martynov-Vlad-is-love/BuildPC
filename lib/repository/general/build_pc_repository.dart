import 'dart:convert' as convert;

import 'package:buildpc/constant.dart';
import 'package:buildpc/model/general/build_pc.dart';
import 'package:buildpc/repository/repository.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BuildPcRepository implements Repository<BuildPC> {
  final path = 'BuildPC';
  final header = {
    'Content-type': 'application/json',
  };

  Future<String?> _getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString('Token');
  }

  @override
  Future<void> deleteData(int id) async {
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    await http.delete(
      Uri.http(apiPath, '/api/admin/buildPc/$id'),
      headers: header,
    );
  }

  @override
  Future<List<BuildPC>> getAllData() async {
    List<BuildPC> buildPc = [];
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/buildPc'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData = convert.jsonDecode(response.body) as List<dynamic>;

      final data =
          jsonData.map((value) => value as Map<String, dynamic>).toList();

      buildPc = data.map((e) => BuildPC.fromJson(e)).toList();
    }

    return buildPc;
  }

  @override
  Future<BuildPC?> getDataById(int? id) async {
    BuildPC? formFactor;
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/buildPc/$id'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      formFactor = BuildPC.fromJson(jsonData);
    }

    return formFactor;
  }

  @override
  Future<void> postData(BuildPC buildPc) async {
    try {
      final jsonData = buildPc.toJson();
      final header = {
        'Content-type': 'application/json',
      };
      await http.post(
        Uri.http(apiPath, '/api/admin/buildPc'),
        headers: header,
        body: convert.jsonEncode(jsonData),
      );
    } catch (ex) {
      rethrow;
    }
  }

  @override
  Future<void> updateData(BuildPC buildPc) async {
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final jsonData = buildPc.toJson();
    await http.patch(
      Uri.http(
        apiPath,
        '/api/buildPc/buildPc/${buildPc.id}',
      ),
      body: convert.jsonEncode(jsonData),
      headers: header,
    );
  }
}
