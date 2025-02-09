import 'package:flutter/material.dart';
import 'organization_details_view.dart';
import 'user_list_view.dart';

class OrganizationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('企業組織管理'),
          bottom: TabBar(
            tabs: [
              Tab(text: '檢視/修改組織資料'),
              Tab(text: '組織使用者名單'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            OrganizationDetailsView(),
            UserListView(),
          ],
        ),
      ),
    );
  }
}