import 'dart:convert' as convert;

import 'package:buildpc/constant.dart';
import 'package:buildpc/model/general/producers.dart';
import 'package:buildpc/repository/repository.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProducersRepository implements Repository<Producers> {
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
      Uri.http(apiPath, '/api/admin/producers/$id'),
      headers: header,
    );
  }

  @override
  Future<List<Producers>> getAllData() async {
    List<Producers> producers = [];
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final response =
    await http.get(Uri.http(apiPath, '/api/all/producers'), headers: header);

    if (response.statusCode == 200) {
      final jsonData = convert.jsonDecode(response.body) as List<dynamic>;

      final data =
      jsonData.map((value) => value as Map<String, dynamic>).toList();

      producers = data.map((e) => Producers.fromJson(e)).toList();
    }

    return producers;
  }

  @override
  Future<Producers?> getDataById(int? id) async {
    Producers? producers;
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/producers/$id'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData =
      convert.jsonDecode(response.body) as Map<String, dynamic>;

      producers = Producers.fromJson(jsonData);
    }

    return producers;
  }

  @override
  Future<void> postData(Producers producers) async {
    try {
      final jsonData = producers.toJson();
      final header = {
        'Content-type': 'application/json',
      };
      await http.post(
        Uri.http(apiPath, '/api/admin/producers'),
        headers: header,
        body: convert.jsonEncode(jsonData),
      );
    } catch (ex) {
      rethrow;
    }
  }

  @override
  Future<void> updateData(Producers producers) async {
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final jsonData = producers.toJson();
    await http.patch(
      Uri.http(apiPath, '/api/admin/producers/${producers.id}'),
      body: convert.jsonEncode(jsonData),
      headers: header,
    );
  }
}
