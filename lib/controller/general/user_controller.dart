import 'dart:async';

import 'package:buildpc/controller/model_controller_abstract.dart';
import 'package:buildpc/model/general/e_role.dart';
import 'package:buildpc/model/general/user.dart';
import 'package:buildpc/repository/general/user_repository.dart';
import 'package:flutter/widgets.dart';

class UserController extends ChangeNotifier
    implements ModelControllerAbstract<User> {
  User? _user;
  final UserRepository _userRepository;
  StreamSubscription<User?>? _userStream;

  UserRepository? get userRepository => _userRepository;

  User? get user => _user;

  UserController(this._userRepository) {
    subscriptionToUpdates(_userRepository.user);
  }

  Future<void> streamListener(User? users) async {
    _user = users;
    notifyListeners();
  }

  Future<void> subscriptionToUpdates(Stream<User?> userStream) async {
    _userStream = userStream.listen(streamListener);
  }

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
    final User user = User(
      null,
      name: name,
      username: userName,
      email: eMail,
      password: password,
      role: ERole.ROLE_USER,
    );
    final register = await _userRepository.registration(user);
    notifyListeners();

    return register;
  }

  @override
  Future<List<User>> getList() async {
    final list = _userRepository.getAllData();
    notifyListeners();

    return list;
  }

  @override
  Future<User?> getDataById(int? id) async {
    final user = _userRepository.getDataById(id);
    notifyListeners();

    return user;
  }

  @override
  Future<void> updateData(User user) async {
    await _userRepository.updateData(user);
    notifyListeners();
  }

  @override
  Future<User?> postData(User user) async {
    await _userRepository.postData(user);
    notifyListeners();

    return getDataById(user.id);
  }

  @override
  Future<void> delete(int id) async {
    await _userRepository.deleteData(id);
    notifyListeners();
  }

  @override
  void dispose() {
    _userStream?.cancel();
    super.dispose();
  }
}
