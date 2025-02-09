import 'package:flutter/material.dart';
import '../controllers/user_controller.dart';
import '../models/sys_user.dart';

class EditProfile extends StatefulWidget {
  final SysUser user;

  EditProfile({required this.user});

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  final UserController _controller = UserController();

  late String email;
  late String address;
  late String phone;

  @override
  void initState() {
    super.initState();
    email = widget.user.email ?? '';
    address = widget.user.address;
    phone = widget.user.phone ?? '';
  }

  void _updateProfile() async {
    if (_formKey.currentState!.validate()) {
      SysUser updatedUser = widget.user.copyWith(
        email: email,
        address: address,
        phone: phone,
      );

      bool success = await _controller.updateUser(updatedUser);
      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('更新成功')));
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('更新失敗')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('編輯個人資料')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: email,
                decoration: InputDecoration(labelText: '電子郵件'),
                validator: (value) => !value!.contains('@') ? '請輸入有效的電子郵件' : null,
                onChanged: (value) => email = value,
              ),
              TextFormField(
                initialValue: address,
                decoration: InputDecoration(labelText: '聯絡地址'),
                validator: (value) => value!.isEmpty ? '地址不能為空' : null,
                onChanged: (value) => address = value,
              ),
              TextFormField(
                initialValue: phone,
                decoration: InputDecoration(labelText: '連絡電話'),
                validator: (value) => value!.isEmpty ? '請輸入電話' : null,
                onChanged: (value) => phone = value,
              ),
              ElevatedButton(
                onPressed: _updateProfile,
                child: Text('保存變更'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
