import 'package:flutter/material.dart';
import '../controllers/user_controller.dart';
import '../models/sys_user.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final UserController _controller = UserController();

  String username = '';
  String password = '';
  String realname = '';
  String email = '';
  String country = '';
  String state = '';
  String address = '';
  String docfile1 = 'default-doc-uuid'; // 假設一個預設的檔案 UUID

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      SysUser newUser = SysUser(
        uuid: 'auto-generated-uuid',
        username: username,
        password: password,
        realname: realname,
        docfile1: docfile1,
        country: country,
        state: state,
        address: address,
        email: email,
      );

      bool success = await _controller.register(newUser);
      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('註冊成功')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('註冊失敗')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('會員註冊')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: '帳號'),
                validator: (value) => value!.isEmpty ? '請輸入帳號' : null,
                onChanged: (value) => username = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: '密碼'),
                obscureText: true,
                validator: (value) => value!.length < 6 ? '密碼需至少 6 碼' : null,
                onChanged: (value) => password = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: '真實姓名'),
                validator: (value) => value!.isEmpty ? '請輸入真實姓名' : null,
                onChanged: (value) => realname = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: '電子郵件'),
                validator: (value) => !value!.contains('@') ? '請輸入有效的電子郵件' : null,
                onChanged: (value) => email = value,
              ),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('註冊'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
