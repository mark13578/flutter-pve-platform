import 'package:flutter/material.dart';
import '../controllers/user_controller.dart';
import '../models/sys_user.dart';
import 'edit_profile.dart';

class UserProfile extends StatefulWidget {
  final String userId;  // 傳入使用者 ID

  UserProfile({required this.userId});

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final UserController _controller = UserController();
  SysUser? user;

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  void _loadUserInfo() async {
    SysUser? userInfo = await _controller.fetchUserInfo(widget.userId);
    setState(() {
      user = userInfo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('個人中心')),
      body: user == null
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('帳號: ${user!.username}', style: TextStyle(fontSize: 18)),
                  Text('真實姓名: ${user!.realname}'),
                  Text('電子郵件: ${user!.email ?? '未提供'}'),
                  Text('地址: ${user!.address}'),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfile(user: user!),
                        ),
                      ).then((_) => _loadUserInfo()); // 更新資料後重新加載
                    },
                    child: Text('編輯個人資料'),
                  ),
                ],
              ),
            ),
    );
  }
}
