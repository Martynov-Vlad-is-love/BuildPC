import 'dart:convert' as convert;

import 'package:buildpc/constant.dart';
import 'package:buildpc/model/storage/ssd_cells_type.dart';
import 'package:buildpc/repository/repository.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SsdCellsTypeRepository implements Repository<SsdCellsType> {
  final path = 'SsdCellsType';
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
      Uri.http(apiPath, '/api/admin/ssdCellsType/$id'),
      headers: header,
    );
  }

  @override
  Future<List<SsdCellsType>> getAllData() async {
    List<SsdCellsType> cellsType = [];
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/ssdCellsType'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData = convert.jsonDecode(response.body) as List<dynamic>;

      final data =
      jsonData.map((value) => value as Map<String, dynamic>).toList();

      cellsType = data.map((e) => SsdCellsType.fromJson(e)).toList();
    }

    return cellsType;
  }

  @override
  Future<SsdCellsType?> getDataById(int? id) async {
    SsdCellsType? cellsType;
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/ssdCellsType/$id'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData =
      convert.jsonDecode(response.body) as Map<String, dynamic>;

      cellsType = SsdCellsType.fromJson(jsonData);
    }

    return cellsType;
  }

  @override
  Future<void> postData(SsdCellsType cellsType) async {
    try {
      final jsonData = cellsType.toJson();
      final header = {
        'Content-type': 'application/json',
      };
      await http.post(
        Uri.http(apiPath, '/api/admin/ssdCellsType'),
        headers: header,
        body: convert.jsonEncode(jsonData),
      );
    } catch (ex) {
      rethrow;
    }
  }

  @override
  Future<void> updateData(SsdCellsType cellsType) async {
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final jsonData = cellsType.toJson();
    await http.patch(
      Uri.http(
        apiPath,
        '/api/admin/ssdCellsType/${cellsType.id}',
      ),
      body: convert.jsonEncode(jsonData),
      headers: header,
    );
  }
}
