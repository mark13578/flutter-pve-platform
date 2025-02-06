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
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLogin = true;

  void _toggleAuthMode() {
    setState(() {
      _isLogin = !_isLogin;
    });
  }

  void _authenticate() {
    if (_usernameController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_isLogin ? '登入' : '註冊')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: '帳號'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: '密碼'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _authenticate,
              child: Text(_isLogin ? '登入' : '註冊'),
            ),
            TextButton(
              onPressed: _toggleAuthMode,
              child: Text(_isLogin ? '沒有帳號？註冊' : '已經有帳號？登入'),
            ),
          ],
        ),
      ),
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
    "系統管理": ["本人帳號", "他人帳號", "企業組織管理", "組織權限分配", "資產管理", "公告管理", "系統日誌"],
    "工單管理": ["建立工單"],
    "虛擬機操作": ["虛擬機", "虛擬機操作", "可用資產管理"],
    "財務管理": ["月結帳單管理", "成本核算", "其他進項管理"]
  };

  final Map<String, Widget> pages = {
    "首頁": Center(child: Text("歡迎來到 Proxmox VE 管理平台", style: TextStyle(fontSize: 20))),
    "本人帳號": Center(child: Text("這是本人帳號管理頁面", style: TextStyle(fontSize: 20))),
    "他人帳號": Center(child: Text("這是他人帳號管理頁面", style: TextStyle(fontSize: 20))),
    "企業組織管理": Center(child: Text("這是企業組織管理頁面", style: TextStyle(fontSize: 20))),
    "組織權限分配": Center(child: Text("這是組織權限分配頁面", style: TextStyle(fontSize: 20))),
    "資產管理": Center(child: Text("這是資產管理頁面", style: TextStyle(fontSize: 20))),
    "公告管理": Center(child: Text("這是公告管理頁面", style: TextStyle(fontSize: 20))),
    "系統日誌": Center(child: Text("這是系統日誌頁面", style: TextStyle(fontSize: 20))),
    "建立工單": Center(child: Text("歡迎來到 Proxmox VE 管理平台", style: TextStyle(fontSize: 20))),
    "虛擬機": Center(child: Text("這是本人帳號管理頁面", style: TextStyle(fontSize: 20))),
    "虛擬機操作": Center(child: Text("這是他人帳號管理頁面", style: TextStyle(fontSize: 20))),
    "可用資產管理": Center(child: Text("這是企業組織管理頁面", style: TextStyle(fontSize: 20))),
    "月結帳單管理": Center(child: Text("這是組織權限分配頁面", style: TextStyle(fontSize: 20))),
    "成本核算": Center(child: Text("這是資產管理頁面", style: TextStyle(fontSize: 20))),
    "其他進項管理": Center(child: Text("這是公告管理頁面", style: TextStyle(fontSize: 20))),
   
  };

  void _logout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_selectedPage)),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.blue),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Proxmox VE 管理平台', style: TextStyle(color: Colors.white, fontSize: 20)),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: _logout,
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: const Text('登出', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
            for (var category in menuItems.keys) ...[
              ListTile(
                title: Text(category, style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
              for (var item in menuItems[category]!)
                ListTile(
                  title: Text(item),
                  onTap: () {
                    setState(() {
                      _selectedPage = item;
                    });
                    Navigator.pop(context);
                  },
                ),
            ]
          ],
        ),
      ),
      body: pages[_selectedPage] ?? const Center(child: Text("頁面未找到", style: TextStyle(fontSize: 20))),
    );
  }
}