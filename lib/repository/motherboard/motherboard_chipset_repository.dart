import 'dart:convert' as convert;

import 'package:buildpc/constant.dart';
import 'package:buildpc/model/motherboard/motherboard_chipset.dart';
import 'package:buildpc/repository/repository.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MotherboardChipsetRepository implements Repository<MotherboardChipset> {
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
      Uri.http(apiPath, '/api/admin/motherboardChipset/$id'),
      headers: header,
    );
  }

  @override
  Future<List<MotherboardChipset>> getAllData() async {
    List<MotherboardChipset> motherboardChipset = [];
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/motherboardChipset'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData = convert.jsonDecode(response.body) as List<dynamic>;

      final data =
          jsonData.map((value) => value as Map<String, dynamic>).toList();

      motherboardChipset =
          data.map((e) => MotherboardChipset.fromJson(e)).toList();
    }

    return motherboardChipset;
  }

  @override
  Future<MotherboardChipset?> getDataById(int? id) async {
    MotherboardChipset? motherboardChipset;
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/motherboardChipset/$id'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      motherboardChipset = MotherboardChipset.fromJson(jsonData);
    }

    return motherboardChipset;
  }

  @override
  Future<void> postData(MotherboardChipset motherboardChipset) async {
    try {
      final jsonData = motherboardChipset.toJson();
      final header = {
        'Content-type': 'application/json',
      };
      await http.post(
        Uri.http(apiPath, '/api/admin/motherboardChipset'),
        headers: header,
        body: convert.jsonEncode(jsonData),
      );
    } catch (ex) {
      rethrow;
    }
  }

  @override
  Future<void> updateData(MotherboardChipset motherboardChipset) async {
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final jsonData = motherboardChipset.toJson();
    await http.patch(
      Uri.http(
        apiPath,
        '/api/admin/motherboardChipset/${motherboardChipset.id}',
      ),
      body: convert.jsonEncode(jsonData),
      headers: header,
    );
  }
}
