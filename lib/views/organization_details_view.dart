import 'package:flutter/material.dart';

class OrganizationDetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextFormField(decoration: InputDecoration(labelText: '組織名稱')),
          TextFormField(decoration: InputDecoration(labelText: '公司電話')),
          TextFormField(decoration: InputDecoration(labelText: '分機')),
          TextFormField(decoration: InputDecoration(labelText: '統一編號')),
          TextFormField(decoration: InputDecoration(labelText: '系統管理員')),
          TextFormField(decoration: InputDecoration(labelText: '技術聯絡人')),
          TextFormField(decoration: InputDecoration(labelText: '帳務聯絡人')),
          ElevatedButton(
            onPressed: () {},
            child: Text('保存變更'),
          ),
        ],
      ),
    );
  }
}