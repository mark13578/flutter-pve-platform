import '../models/sys_user.dart';
import '../models/user.dart';
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

  Future<List<User>> fetchUsersByOrganization(String orgId) async {
    final data = await apiService.get('/users?orgid=$orgId');
    return (data as List).map((json) => User.fromJson(json)).toList();
  }

  Future<void> addUser(User user) async {
    await apiService.post('/user/add', {
      'username': user.username,
      'realname': user.realname,
      'phone': user.phone,
      'email': user.email,
      'country': user.country,
    });
  }

  Future<void> deleteUser(String userId) async {
    await apiService.post('/user/delete', {'uuid': userId});
  }
}
