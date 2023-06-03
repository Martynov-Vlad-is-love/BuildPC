import 'dart:convert' as convert;

import 'package:buildpc/constant.dart';
import 'package:buildpc/model/general/like.dart';
import 'package:buildpc/repository/repository.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LikeRepository implements Repository<Like> {
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
      Uri.http(apiPath, '/api/like/like/$id'),
      headers: header,
    );
  }

  @override
  Future<List<Like>> getAllData() async {
    List<Like> likes = [];
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final response =
        await http.get(Uri.http(apiPath, '/api/like/like'), headers: header);

    if (response.statusCode == 200) {
      final jsonData = convert.jsonDecode(response.body) as List<dynamic>;

      final data =
          jsonData.map((value) => value as Map<String, dynamic>).toList();

      likes = data.map((e) => Like.fromJson(e)).toList();
    }

    return likes;
  }

  @override
  Future<Like?> getDataById(int? id) async {
    Like? like;
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/like/like/$id'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      like = Like.fromJson(jsonData);
    }

    return like;
  }

  @override
  Future<void> postData(Like like) async {
    try {
      final jsonData = like.toJson();
      final header = {
        'Content-type': 'application/json',
      };
      await http.post(
        Uri.http(apiPath, '/api/like/like'),
        headers: header,
        body: convert.jsonEncode(jsonData),
      );
    } catch (ex) {
      rethrow;
    }
  }

  @override
  Future<void> updateData(Like like) async {
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final jsonData = like.toJson();
    await http.patch(
      Uri.http(
        apiPath,
        '/api/like/like/${like.id}',
      ),
      body: convert.jsonEncode(jsonData),
      headers: header,
    );
  }
}
