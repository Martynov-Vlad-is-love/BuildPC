import 'dart:convert' as convert;

import 'package:buildpc/constant.dart';
import 'package:buildpc/model/general/admin.dart';
import 'package:buildpc/repository/repository.dart';
import 'package:http/http.dart' as http;

class AdminRepository implements Repository<Admin> {

  final path = 'User';

  // Future<Admin?> authentication(String login, String password) async {
  //   Admin? admin;
  //   try {
  //     final Map<String, String> jsonData = {
  //       'login': login,
  //       'password': password
  //     };
  //
  //     final response = await http
  //         .get(Uri.https(authority, '${unEncodedPath+path}/Auth', jsonData),  );
  //
  //     if (response.statusCode == 200) {
  //       final jsonData =
  //       convert.jsonDecode(response.body) as Map<String, dynamic>;
  //
  //
  //       return admin = Admin.fromJson(jsonData);
  //     } else {
  //       return null;
  //     }
  //   } catch (ex) {
  //     //print(ex);
  //
  //     return admin;
  //   }
  // }

  // Future<void> registration(User user) async {
  //   try {
  //     final jsonMap = user.registrationToJson() as Map<String, dynamic>;
  //
  //     for (var item in jsonMap.keys) {
  //       print("$item: ${jsonMap[item]}, ${jsonMap[item].runtimeType}");
  //     }
  //
  //     final response = await http.post(Uri.https(authority, '$unEncodedPath/Registration', jsonMap));
  //     print("Status code ${response.body}");
  //   } catch (ex) {
  //     print(ex);
  //   }
  // }

  @override
  Future<void> deleteData(int id) {
    // TODO: implement deleteData
    throw UnimplementedError();
  }

  @override
  Future<List<Admin>> getAllData() {
    // TODO: implement getAllData
    throw UnimplementedError();
  }

  @override
  Future<Admin> getDataById(int? id) {
    // TODO: implement getDataById
    throw UnimplementedError();
  }

  @override
  Future<void> postData(Admin admin) async {
    // TODO: implement postData
    throw UnimplementedError();
  }

  @override
  Future<void> updateData(Admin admin) {
    // TODO: implement updateData
    throw UnimplementedError();
  }
}
