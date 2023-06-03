import 'dart:convert' as convert;

import 'package:buildpc/constant.dart';
import 'package:buildpc/model/general/rating.dart';
import 'package:buildpc/repository/repository.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RatingRepository implements Repository<Rating> {
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
      Uri.http(apiPath, '/api/admin/rating/$id'),
      headers: header,
    );
  }

  @override
  Future<List<Rating>> getAllData() async {
    List<Rating> rating = [];
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final response =
        await http.get(Uri.http(apiPath, '/api/all/rating'), headers: header);

    if (response.statusCode == 200) {
      final jsonData = convert.jsonDecode(response.body) as List<dynamic>;

      final data =
          jsonData.map((value) => value as Map<String, dynamic>).toList();

      rating = data.map((e) => Rating.fromJson(e)).toList();
    }

    return rating;
  }

  @override
  Future<Rating?> getDataById(int? id) async {
    Rating? rating;
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/rating/$id'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      rating = Rating.fromJson(jsonData);
    }

    return rating;
  }

  @override
  Future<void> postData(Rating rating) async {
    try {
      final jsonData = rating.toJson();
      final header = {
        'Content-type': 'application/json',
      };
      await http.post(
        Uri.http(apiPath, '/api/admin/rating'),
        headers: header,
        body: convert.jsonEncode(jsonData),
      );
    } catch (ex) {
      rethrow;
    }
  }

  @override
  Future<void> updateData(Rating rating) async {
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final jsonData = rating.toJson();
    await http.patch(
      Uri.http(
        apiPath,
        '/api/admin/rating/${rating.id}',
      ),
      body: convert.jsonEncode(jsonData),
      headers: header,
    );
  }
}
