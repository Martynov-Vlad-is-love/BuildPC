import 'dart:convert' as convert;

import 'package:buildpc/constant.dart';
import 'package:buildpc/model/general/user.dart';
import 'package:buildpc/repository/repository.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository implements Repository<User> {
  final path = 'User';
  final header = {
    'Content-type': 'application/json',
  };

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
        final Future<SharedPreferences> _prefs =
            SharedPreferences.getInstance();

        final SharedPreferences prefs = await _prefs;

        await prefs.setString('Token', jsonData['accessToken'].toString());

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

        await prefs.setString('Token', jsonData['accessToken'].toString());

        return user;
      } else {
        return null;
      }
    } catch (ex) {
      return user;
    }
  }
  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString('token');
  }

  @override
  Future<void> deleteData(int id) async{
    final jsonData = {
      'id': id
    };

    final token = await getToken();
    final header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    await http.delete(Uri.http(apiPath, '/api/user/user'), headers: header, body: convert.jsonEncode(jsonData));

  }

  @override
  Future<List<User>> getAllData() {
    // TODO: implement getAllData
    throw UnimplementedError();
  }

  @override
  Future<User> getDataById(int? id) {
    // TODO: implement getDataById
    throw UnimplementedError();
  }

  @override
  Future<void> postData(User user) async {
    // TODO: implement postData
    throw UnimplementedError();
  }

  @override
  Future<void> updateData(User user) {
    // TODO: implement updateData
    throw UnimplementedError();
  }
}
