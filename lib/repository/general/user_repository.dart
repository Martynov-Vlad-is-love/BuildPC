import 'dart:async';
import 'dart:convert' as convert;

import 'package:buildpc/constant.dart';
import 'package:buildpc/model/general/user.dart';
import 'package:buildpc/repository/repository.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository implements Repository<User> {

  final _user = StreamController<User?>();

  Stream<User?> get user => _user.stream;

  Future<User?> authentication(String login, String password) async {
    User? user;
    try {
      final jsonData = {'username': login, 'password': password};
      final header = {
        'Content-type': 'application/json',
      };
      final response = await http.post(
        Uri.http(apiPath, '/api/auth/signin'),
        headers: header,
        body: convert.jsonEncode(jsonData),
      );

      if (response.statusCode == 200) {
        final jsonData =
            convert.jsonDecode(response.body) as Map<String, dynamic>;

        user = User.fromJson(jsonData);
        final Future<SharedPreferences> _prefs =SharedPreferences.getInstance();
        _user.sink.add(user);

        final SharedPreferences prefs = await _prefs;
        await prefs.setString('token', jsonData['accessToken'].toString());

        return user;
      } else {
        return null;
      }
    } catch (ex) {
      return user;
    }
  }

  Future<User?> registration(User user) async {
    user.toJson();
    try {
      final jsonData = user.toJson();
      jsonData.remove('id');
      jsonData.remove('role');
      final header = {
        'Content-type': 'application/json',
      };
      final response = await http.post(
        Uri.http(apiPath, '/api/auth/signup'),
        headers: header,
        body: convert.jsonEncode(jsonData),
      );

      if (response.statusCode == 200) {
        final jsonData =
            convert.jsonDecode(response.body) as Map<String, dynamic>;

        final user = User.fromJson(jsonData);
        final Future<SharedPreferences> _prefs =
            SharedPreferences.getInstance();

        final SharedPreferences prefs = await _prefs;

        await prefs.setString('token', jsonData['accessToken'].toString());

        return user;
      } else {
        return null;
      }
    } catch (ex) {
      return user;
    }
  }

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
      Uri.http(apiPath, '/api/admin/user/$id'),
      headers: header,
    );
  }

  @override
  Future<List<User>> getAllData() async {
    List<User> users = [];
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final response =
        await http.get(Uri.http(apiPath, '/api/all/user'), headers: header);

    if (response.statusCode == 200) {
      final jsonData = convert.jsonDecode(response.body) as List<dynamic>;

      final data =
          jsonData.map((value) => value as Map<String, dynamic>).toList();

      users = data.map((e) => User.fromJson(e)).toList();
    }

    return users;
  }

  @override
  Future<User?> getDataById(int? id) async {
    User? user;
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final response = await http.get(
      Uri.http(apiPath, '/api/all/user/$id'),
      headers: header,
    );

    if (response.statusCode == 200) {
      final jsonData =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      user = User.fromJson(jsonData);
    }

    return user;
  }

  @override
  Future<void> postData(User user) async {
    final token = await _getToken();
    try {
      final jsonData = user.toJson();
      final header = {
        'Content-type': 'application/json',
        'Authorization': 'Bearer $token',
        'Access-Control-Allow-Origin': '*',
        'Accept': '*/*',
      };
      await http.post(
        Uri.http(apiPath, '/api/admin/user'),
        headers: header,
        body: convert.jsonEncode(jsonData),
      );
    } catch (ex) {
      rethrow;
    }

  }

  @override
  Future<void> updateData(User user) async {
    final token = await _getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*',
    };

    final jsonData = user.toJson();
    jsonData.remove('password');
    final response = await http.put(
      Uri.http(apiPath, '/api/admin/user/${user.id}'),
      body: convert.jsonEncode(jsonData),
      headers: header,
    );
    print(response);
  }
  void dispose(){
    _user.close();
  }

}
