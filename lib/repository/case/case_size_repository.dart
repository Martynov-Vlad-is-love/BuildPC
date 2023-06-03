import 'dart:convert' as convert;

import 'package:buildpc/constant.dart';
import 'package:buildpc/model/case/case_size.dart';
import 'package:buildpc/repository/repository.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CaseSizeRepository implements Repository<CaseSize> {
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
      Uri.http(apiPath, '/api/admin/caseSize/$id'),
      headers: header,
    );
  }

  @override
  Future<List<CaseSize>> getAllData() async {
    List<CaseSize> caseSize = [];
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/caseSize'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData = convert.jsonDecode(response.body) as List<dynamic>;

      final data =
          jsonData.map((value) => value as Map<String, dynamic>).toList();

      caseSize = data.map((e) => CaseSize.fromJson(e)).toList();
    }

    return caseSize;
  }

  @override
  Future<CaseSize?> getDataById(int? id) async {
    CaseSize? caseSize;
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/caseSize/$id'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      caseSize = CaseSize.fromJson(jsonData);
    }

    return caseSize;
  }

  @override
  Future<void> postData(CaseSize caseSize) async {
    try {
      final jsonData = caseSize.toJson();
      final header = {
        'Content-type': 'application/json',
      };
      await http.post(
        Uri.http(apiPath, '/api/admin/caseSize'),
        headers: header,
        body: convert.jsonEncode(jsonData),
      );
    } catch (ex) {
      rethrow;
    }
  }

  @override
  Future<void> updateData(CaseSize caseSize) async {
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final jsonData = caseSize.toJson();
    await http.patch(
      Uri.http(
        apiPath,
        '/api/admin/caseSize/${caseSize.id}',
      ),
      body: convert.jsonEncode(jsonData),
      headers: header,
    );
  }
}
