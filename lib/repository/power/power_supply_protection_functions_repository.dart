import 'dart:convert' as convert;

import 'package:buildpc/constant.dart';
import 'package:buildpc/model/power/power_supply_protection_functions.dart';
import 'package:buildpc/repository/repository.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PowerSupplyProtectionFunctionsRepository
    implements Repository<PowerSupplyProtectionFunctions> {
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
      Uri.http(apiPath, '/api/admin/powerSupplyProtectionFunctions/$id'),
      headers: header,
    );
  }

  @override
  Future<List<PowerSupplyProtectionFunctions>> getAllData() async {
    List<PowerSupplyProtectionFunctions> powerSupplyProtectionFunctions = [];
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/powerSupplyProtectionFunction'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData = convert.jsonDecode(response.body) as List<dynamic>;

      final data =
          jsonData.map((value) => value as Map<String, dynamic>).toList();

      powerSupplyProtectionFunctions =
          data.map((e) => PowerSupplyProtectionFunctions.fromJson(e)).toList();
    }

    return powerSupplyProtectionFunctions;
  }

  @override
  Future<PowerSupplyProtectionFunctions?> getDataById(int? id) async {
    PowerSupplyProtectionFunctions? powerSupplyProtectionFunctions;
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/powerSupplyProtectionFunction/$id'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      powerSupplyProtectionFunctions =
          PowerSupplyProtectionFunctions.fromJson(jsonData);
    }

    return powerSupplyProtectionFunctions;
  }

  @override
  Future<void> postData(
      PowerSupplyProtectionFunctions powerSupplyProtectionFunctions,) async {
    final token = await _getToken();
    try {
      final jsonData = powerSupplyProtectionFunctions.toJson();
      final header = {
        'Content-type': 'application/json',
        'Authorization': 'Bearer $token',
        'Access-Control-Allow-Origin': '*',
        'Accept': '*/*',
      };
      await http.post(
        Uri.http(apiPath, '/api/admin/powerSupplyProtectionFunction'),
        headers: header,
        body: convert.jsonEncode(jsonData),
      );
    } catch (ex) {
      rethrow;
    }
  }

  @override
  Future<void> updateData(
      PowerSupplyProtectionFunctions powerSupplyProtectionFunctions,) async {
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final jsonData = powerSupplyProtectionFunctions.toJson();
    await http.put(
      Uri.http(
        apiPath,
        '/api/admin/powerSupplyProtectionFunction/${powerSupplyProtectionFunctions.id}',
      ),
      body: convert.jsonEncode(jsonData),
      headers: header,
    );
  }
}
