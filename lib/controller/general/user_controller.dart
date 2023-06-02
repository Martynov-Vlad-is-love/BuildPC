import 'dart:async';

import 'package:buildpc/model/general/e_role.dart';
import 'package:buildpc/model/general/user.dart';
import 'package:buildpc/repository/general/user_repository.dart';
import 'package:flutter/cupertino.dart';

class UserController extends ChangeNotifier {
  User? _user;

  final UserRepository _userRepository;

  UserRepository? get userRepository => _userRepository;

  User? get user => _user;

  UserController(this._userRepository);

  Future<User?> authentication(String login, String password) async {
    final auth = await _userRepository.authentication(login, password);
    notifyListeners();

    return auth;
  }

  Future<User?> registration(
    String userName,
    String password,
    String eMail,
    String name,
  ) async {
    final User user = User(null, name, userName, eMail, password, null);
    final register = await _userRepository.registration(user);
    notifyListeners();

    return register;
  }

  // Future<void> registration(User user) async{
  //   return _userRepository.registration(user);
  // }

  Future<List<User>?> getUsersList() async {
    final list = _userRepository?.getAllData();
    notifyListeners();

    return list;
  }

  Future<User?> getUserData(int? id) async {
    return _userRepository.getDataById(id);
  }

  Future<void> updateUserData(User user) async {
    await _userRepository.updateData(user);
  }

  Future<User?> postUserData(User user) async {
    await _userRepository.postData(user);

    return getUserData(user.id);
  }

  Future<void> deleteUser(int id) async {
    await _userRepository.deleteData(id);
  }
}
