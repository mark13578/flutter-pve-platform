import 'package:flutter/material.dart';
import '../controllers/user_controller.dart';
import '../models/user.dart';

class UserListView extends StatefulWidget {
  @override
  _UserListViewState createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  final UserController _userController = UserController();
  List<User> _users = [];
  Map<String, bool> _selectedUsers = {};

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    final users = await _userController.fetchUsersByOrganization('org-uuid'); // Replace with actual org ID
    setState(() {
      _users = users;
      _selectedUsers = {for (var user in users) user.uuid: false};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(onPressed: () {}, child: Text('匯入使用者')),
            ElevatedButton(onPressed: () {}, child: Text('新增使用者')),
            ElevatedButton(onPressed: () {}, child: Text('編輯使用者')),
            ElevatedButton(onPressed: () {}, child: Text('刪除使用者')),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: [
                DataColumn(label: Text('選取')),
                DataColumn(label: Text('使用者名稱')),
                DataColumn(label: Text('姓名')),
                DataColumn(label: Text('連絡電話')),
                DataColumn(label: Text('電子郵件')),
              ],
              rows: _users.map((user) {
                return DataRow(
                  selected: _selectedUsers[user.uuid] ?? false,
                  onSelectChanged: (selected) {
                    setState(() {
                      _selectedUsers[user.uuid] = selected ?? false;
                    });
                  },
                  cells: [
                    DataCell(Checkbox(
                      value: _selectedUsers[user.uuid] ?? false,
                      onChanged: (bool? value) {
                        setState(() {
                          _selectedUsers[user.uuid] = value ?? false;
                        });
                      },
                    )),
                    DataCell(Text(user.username)),
                    DataCell(Text(user.realname)),
                    DataCell(Text(user.phone)),
                    DataCell(Text(user.email)),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}