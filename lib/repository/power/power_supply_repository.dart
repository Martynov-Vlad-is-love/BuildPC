import 'dart:convert' as convert;

import 'package:buildpc/constant.dart';
import 'package:buildpc/model/power/power_supply.dart';
import 'package:buildpc/repository/repository.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PowerSupplyRepository implements Repository<PowerSupply> {
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
      Uri.http(apiPath, '/api/admin/powerSupply/$id'),
      headers: header,
    );
  }

  @override
  Future<List<PowerSupply>> getAllData() async {
    List<PowerSupply> powerSupply = [];
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/powerSupply'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData = convert.jsonDecode(response.body) as List<dynamic>;

      final data =
          jsonData.map((value) => value as Map<String, dynamic>).toList();

      powerSupply = data.map((e) => PowerSupply.fromJson(e)).toList();
    }

    return powerSupply;
  }

  @override
  Future<PowerSupply?> getDataById(int? id) async {
    PowerSupply? powerSupply;
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/powerSupply/$id'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      powerSupply = PowerSupply.fromJson(jsonData);
    }

    return powerSupply;
  }

  @override
  Future<void> postData(PowerSupply powerSupply) async {
    final token = await _getToken();

    try {
      final jsonData = powerSupply.toJson();
      final header = {
        'Content-type': 'application/json',
        'Authorization': 'Bearer $token',
        'Access-Control-Allow-Origin': '*',
        'Accept': '*/*',
      };
      final response = await http.post(
        Uri.http(apiPath, '/api/admin/powerSupply'),
        headers: header,
        body: convert.jsonEncode(jsonData),
      );
      print(response.statusCode);
    } catch (ex) {
      rethrow;
    }
  }

  @override
  Future<void> updateData(PowerSupply powerSupply) async {
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final jsonData = powerSupply.toJson();
    await http.put(
      Uri.http(
        apiPath,
        '/api/admin/powerSupply/${powerSupply.id}',
      ),
      body: convert.jsonEncode(jsonData),
      headers: header,
    );
  }
}
