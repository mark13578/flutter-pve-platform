import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/sys_user.dart';

class ApiService {
  final String baseUrl = 'https://your-api-endpoint.com/api'; // 修改為您的 API 網址

  Future<bool> registerUser(SysUser user) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      print('註冊失敗: ${response.body}');
      return false;
    }
  }

  Future<SysUser?> getUserInfo(String uuid) async {
    final response = await http.get(
      Uri.parse('$baseUrl/user/$uuid'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return SysUser.fromJson(jsonDecode(response.body));
    } else {
      print('取得個人資料失敗: ${response.body}');
      return null;
    }
  }

  Future<bool> updateUserInfo(SysUser user) async {
    final response = await http.put(
      Uri.parse('$baseUrl/user/${user.uuid}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      print('更新個人資料失敗: ${response.body}');
      return false;
    }
  }

  Future<dynamic> get(String path) async {
    final response = await http.get(Uri.parse('$baseUrl$path'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<dynamic> post(String path, Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl$path'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to save data');
    }
  }
}
