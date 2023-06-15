import 'dart:convert' as convert;

import 'package:buildpc/constant.dart';
import 'package:buildpc/model/case/case_power_supply_location.dart';
import 'package:buildpc/repository/repository.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CasePowerSupplyLocationRepository
    implements Repository<CasePowerSupplyLocation> {
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
      Uri.http(apiPath, '/api/admin/casePowerSupplyLocation/$id'),
      headers: header,
    );
  }

  @override
  Future<List<CasePowerSupplyLocation>> getAllData() async {
    List<CasePowerSupplyLocation> casePowerSupplyLocation = [];
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/casePowerSupplyLocation'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData = convert.jsonDecode(response.body) as List<dynamic>;

      final data =
          jsonData.map((value) => value as Map<String, dynamic>).toList();

      casePowerSupplyLocation =
          data.map((e) => CasePowerSupplyLocation.fromJson(e)).toList();
    }

    return casePowerSupplyLocation;
  }

  @override
  Future<CasePowerSupplyLocation?> getDataById(int? id) async {
    CasePowerSupplyLocation? casePowerSupplyLocation;
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/casePowerSupplyLocation/$id'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      casePowerSupplyLocation = CasePowerSupplyLocation.fromJson(jsonData);
    }

    return casePowerSupplyLocation;
  }

  @override
  Future<void> postData(CasePowerSupplyLocation casePowerSupplyLocation) async {
    final token = await _getToken();
    try {
      final jsonData = casePowerSupplyLocation.toJson();
      final header = {
        'Content-type': 'application/json',
        'Authorization': 'Bearer $token',
        'Access-Control-Allow-Origin': '*',
        'Accept': '*/*',
      };
      await http.post(
        Uri.http(apiPath, '/api/admin/casePowerSupplyLocation'),
        headers: header,
        body: convert.jsonEncode(jsonData),
      );
    } catch (ex) {
      rethrow;
    }
  }

  @override
  Future<void> updateData(
    CasePowerSupplyLocation casePowerSupplyLocation,
  ) async {
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final jsonData = casePowerSupplyLocation.toJson();
    await http.put(
      Uri.http(
        apiPath,
        '/api/admin/casePowerSupplyLocation/${casePowerSupplyLocation.id}',
      ),
      body: convert.jsonEncode(jsonData),
      headers: header,
    );
  }
}
