import 'dart:convert' as convert;

import 'package:buildpc/constant.dart';
import 'package:buildpc/model/motherboard/motherboard_network.dart';
import 'package:buildpc/repository/repository.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MotherboardNetworkRepository implements Repository<MotherboardNetwork> {
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
      Uri.http(apiPath, '/api/admin/motherboardNetwork/$id'),
      headers: header,
    );
  }

  @override
  Future<List<MotherboardNetwork>> getAllData() async {
    List<MotherboardNetwork> motherboardNetwork = [];
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/motherboardNetwork'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData = convert.jsonDecode(response.body) as List<dynamic>;

      final data =
          jsonData.map((value) => value as Map<String, dynamic>).toList();

      motherboardNetwork =
          data.map((e) => MotherboardNetwork.fromJson(e)).toList();
    }

    return motherboardNetwork;
  }

  @override
  Future<MotherboardNetwork?> getDataById(int? id) async {
    MotherboardNetwork? motherboardNetwork;
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/motherboardNetwork/$id'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      motherboardNetwork = MotherboardNetwork.fromJson(jsonData);
    }

    return motherboardNetwork;
  }

  @override
  Future<void> postData(MotherboardNetwork motherboardNetwork) async {
    try {
      final jsonData = motherboardNetwork.toJson();
      final header = {
        'Content-type': 'application/json',
      };
      await http.post(
        Uri.http(apiPath, '/api/admin/motherboardNetwork'),
        headers: header,
        body: convert.jsonEncode(jsonData),
      );
    } catch (ex) {
      rethrow;
    }
  }

  @override
  Future<void> updateData(MotherboardNetwork motherboardNetwork) async {
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final jsonData = motherboardNetwork.toJson();
    await http.patch(
      Uri.http(
        apiPath,
        '/api/admin/motherboardNetwork/${motherboardNetwork.id}',
      ),
      body: convert.jsonEncode(jsonData),
      headers: header,
    );
  }
}
