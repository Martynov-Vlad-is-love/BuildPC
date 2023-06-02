import 'package:buildpc/model/general/admin.dart';
import 'package:buildpc/repository/general/admin_repository.dart';
import 'package:flutter/cupertino.dart';

class AdminController extends ChangeNotifier{
  final AdminRepository _adminRepository;
  AdminController(this._adminRepository);

  // Future<Admin?> authentication(String login, String password) async{
  //   return _adminRepository.authentication(login, password);
  // }

  // Future<void> registration(User user) async{
  //   return _userRepository.registration(user);
  // }

  Future<List<Admin>> getAdminsList() async{
    final data = await _adminRepository.getAllData();
    notifyListeners();

    return data;
  }

  Future<Admin?> getAdminData(int id) async{
    final data = await _adminRepository.getDataById(id);
    notifyListeners();

    return data;
  }

  Future<void> updateAdminData(Admin admin) async{
    await _adminRepository.updateData(admin);
    notifyListeners();
  }

  Future<Admin?> postAdminData(Admin user) async{
    await _adminRepository.postData(user);

    return getAdminData(user.id);
  }

  Future<void> deleteUser(int id) async{
    await _adminRepository.deleteData(id);
  }

}
