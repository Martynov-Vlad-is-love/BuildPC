import 'dart:convert' as convert;

import 'package:buildpc/constant.dart';
import 'package:buildpc/model/cooler/cooler_socket.dart';
import 'package:buildpc/repository/repository.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CoolerSocketRepository implements Repository<CoolerSocket> {
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
      Uri.http(apiPath, '/api/admin/coolerSocket/$id'),
      headers: header,
    );
  }

  @override
  Future<List<CoolerSocket>> getAllData() async {
    List<CoolerSocket> coolerSocket = [];
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/coolerSocket'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData = convert.jsonDecode(response.body) as List<dynamic>;

      final data =
          jsonData.map((value) => value as Map<String, dynamic>).toList();

      coolerSocket = data.map((e) => CoolerSocket.fromJson(e)).toList();
    }

    return coolerSocket;
  }

  @override
  Future<CoolerSocket?> getDataById(int? id) async {
    CoolerSocket? coolerSocket;
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/coolerSocket/$id'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      coolerSocket = CoolerSocket.fromJson(jsonData);
    }

    return coolerSocket;
  }

  @override
  Future<void> postData(CoolerSocket coolerSocket) async {
    final token = await _getToken();
    try {
      final jsonData = coolerSocket.toJson();
      final header = {
        'Content-type': 'application/json',
        'Authorization': 'Bearer $token',
        'Access-Control-Allow-Origin': '*',
        'Accept': '*/*',
      };
      final response = await http.post(
        Uri.http(apiPath, '/api/admin/coolerSocket'),
        headers: header,
        body: convert.jsonEncode(jsonData),
      );
      print(response.statusCode);
    } catch (ex) {
      rethrow;
    }
  }

  @override
  Future<void> updateData(CoolerSocket coolerSocket) async {
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final jsonData = coolerSocket.toJson();
    await http.patch(
      Uri.http(
        apiPath,
        '/api/admin/coolerSocket/${coolerSocket.id}',
      ),
      body: convert.jsonEncode(jsonData),
      headers: header,
    );
  }
}
