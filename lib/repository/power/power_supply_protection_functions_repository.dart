import 'dart:convert' as convert;

import 'package:buildpc/constant.dart';
import 'package:buildpc/model/power/power_supply_protection_functions.dart';
import 'package:buildpc/repository/repository.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PowerSupplyProtectionFunctionsRepository
    implements Repository<PowerSupplyProtectionFunctions> {
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
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/powerSupplyProtectionFunctions'),
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
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/powerSupplyProtectionFunctions/$id'),
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
    try {
      final jsonData = powerSupplyProtectionFunctions.toJson();
      final header = {
        'Content-type': 'application/json',
      };
      await http.post(
        Uri.http(apiPath, '/api/admin/powerSupplyProtectionFunctions'),
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
    };

    final jsonData = powerSupplyProtectionFunctions.toJson();
    await http.patch(
      Uri.http(
        apiPath,
        '/api/admin/powerSupplyProtectionFunctions/${powerSupplyProtectionFunctions.id}',
      ),
      body: convert.jsonEncode(jsonData),
      headers: header,
    );
  }
}
