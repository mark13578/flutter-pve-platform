import 'package:flutter/material.dart';

class AddUserView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('新增使用者'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(decoration: InputDecoration(labelText: '帳號')),
            TextFormField(decoration: InputDecoration(labelText: '密碼')),
            TextFormField(decoration: InputDecoration(labelText: '真實姓名')),
            TextFormField(decoration: InputDecoration(labelText: '電話')),
            TextFormField(decoration: InputDecoration(labelText: '電子郵件')),
            TextFormField(decoration: InputDecoration(labelText: '國家'), initialValue: '台灣'),
            ElevatedButton(
              onPressed: () {},
              child: Text('提交'),
            ),
          ],
        ),
      ),
    );
  }
}
