import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Proxmox VE 管理平台',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedPage = "首頁";
  bool _isDrawerPinned = false;
  final Map<String, List<String>> menuItems = {
    "系統管理": [
      "本人帳號", "他人帳號", "企業組織管理", "組織權限分配", "資產管理", "公告管理", "系統日誌"
    ],
    "工單管理": ["建立工單"],
    "虛擬機操作": ["虛擬機", "虛擬機操作", "資產管理"],
    "財務管理": ["月結帳單管理", "成本核算", "其他進項管理"]
  };

  int _tapCount = 0;
  void _handleDrawerTap() {
    _tapCount++;
    if (_tapCount == 2) {
      setState(() {
        _isDrawerPinned = !_isDrawerPinned;
      });
      _tapCount = 0;
    }
    Future.delayed(const Duration(milliseconds: 300), () {
      _tapCount = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedPage),
        leading: _isDrawerPinned
            ? null
            : Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              ),
      ),
      drawer: _isDrawerPinned
          ? null
          : Drawer(
              child: GestureDetector(
                onTap: _handleDrawerTap,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    const DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                      child: Text(
                        'Proxmox VE 管理平台',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    for (var category in menuItems.keys) ...[
                      ListTile(
                        title: Text(category, style: const TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      for (var item in menuItems[category]!)
                        ListTile(
                          leading: const Icon(Icons.description),
                          title: Text(item),
                          onTap: () {
                            setState(() {
                              _selectedPage = item;
                            });
                            if (!_isDrawerPinned) {
                              Navigator.pop(context);
                            }
                          },
                        ),
                    ]
                  ],
                ),
              ),
            ),
      body: Row(
        children: [
          if (_isDrawerPinned)
            NavigationRail(
              selectedIndex: null,
              onDestinationSelected: (int index) {},
              labelType: NavigationRailLabelType.all,
              leading: IconButton(
                icon: const Icon(Icons.menu_open),
                onPressed: () {
                  setState(() {
                    _isDrawerPinned = false;
                  });
                },
              ),
              destinations: [
                for (var category in menuItems.keys) ...[
                  NavigationRailDestination(
                    icon: const Icon(Icons.folder),
                    label: Text(category),
                  ),
                  for (var item in menuItems[category]!)
                    NavigationRailDestination(
                      icon: const Icon(Icons.description),
                      label: Text(item),
                    ),
                ]
              ],
            ),
          Expanded(
            child: Center(
              child: Text(
                '當前頁面: $_selectedPage',
                style: const TextStyle(fontSize: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
