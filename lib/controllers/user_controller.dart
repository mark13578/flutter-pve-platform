import '../models/sys_user.dart';
import '../services/api_service.dart';

class UserController {
  final ApiService apiService = ApiService();

  Future<bool> register(SysUser user) async {
    return await apiService.registerUser(user);
  }

  Future<SysUser?> fetchUserInfo(String uuid) async {
  return await apiService.getUserInfo(uuid);
}

Future<bool> updateUser(SysUser user) async {
  return await apiService.updateUserInfo(user);
}

}
