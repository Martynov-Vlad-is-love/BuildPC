import 'dart:convert' as convert;

import 'package:buildpc/constant.dart';
import 'package:buildpc/model/motherboard/motherboard_socket.dart';
import 'package:buildpc/repository/repository.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MotherboardSocketRepository implements Repository<MotherboardSocket> {
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
      Uri.http(apiPath, '/api/admin/motherboardSocket/$id'),
      headers: header,
    );
  }

  @override
  Future<List<MotherboardSocket>> getAllData() async {
    List<MotherboardSocket> motherboardSocket = [];
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/motherboardSocket'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData = convert.jsonDecode(response.body) as List<dynamic>;

      final data =
          jsonData.map((value) => value as Map<String, dynamic>).toList();

      motherboardSocket =
          data.map((e) => MotherboardSocket.fromJson(e)).toList();
    }

    return motherboardSocket;
  }

  @override
  Future<MotherboardSocket?> getDataById(int? id) async {
    MotherboardSocket? motherboardSocket;
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/motherboardSocket/$id'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      motherboardSocket = MotherboardSocket.fromJson(jsonData);
    }

    return motherboardSocket;
  }

  @override
  Future<void> postData(MotherboardSocket motherboardSocket) async {
    try {
      final jsonData = motherboardSocket.toJson();
      final header = {
        'Content-type': 'application/json',
      };
      await http.post(
        Uri.http(apiPath, '/api/admin/motherboardSocket'),
        headers: header,
        body: convert.jsonEncode(jsonData),
      );
    } catch (ex) {
      rethrow;
    }
  }

  @override
  Future<void> updateData(MotherboardSocket motherboardSocket) async {
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final jsonData = motherboardSocket.toJson();
    await http.patch(
      Uri.http(
        apiPath,
        '/api/admin/motherboardSocket/${motherboardSocket.id}',
      ),
      body: convert.jsonEncode(jsonData),
      headers: header,
    );
  }
}
