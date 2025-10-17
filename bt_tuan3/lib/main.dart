import 'package:flutter/material.dart';

void main() {
  runApp(const UTHApp());
}
// 1. CẤU HÌNH ỨNG DỤNG (Root Widget)
class UTHApp extends StatelessWidget {
  const UTHApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UI Components',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Inter', 
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/list': (context) => const ComponentsListScreen(),
        '/detail': (context) => const DetailScreen(), // Dùng cho tất cả chi tiết
      },
    );
  }
}
// 2. MÀN HÌNH CHÍNH (HOME SCREEN) 
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold là khung cơ bản của màn hình
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // MÔ PHỎNG LOGO/ICON (Sử dụng icon Flutter cơ bản)
            const FlutterLogo(
              size: 120,
              style: FlutterLogoStyle.horizontal,
            ),
            const SizedBox(height: 30),

            // MÔ PHỎNG TEXT "Jetpack Compose"
            const Text(
              'Flutter Toolkit', // Thay thế bằng Flutter
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                'Flutter is a modern UI toolkit for building natively compiled applications from a single codebase.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 60),

            // NÚT "I'm Ready"
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                // Chuyển sang màn hình danh sách khi nhấn nút
                onPressed: () {
                  Navigator.pushNamed(context, '/list');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Màu xanh dương
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25), // Góc bo tròn lớn
                  ),
                ),
                child: const Text('I\'m Ready', style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 3. MÀN HÌNH DANH SÁCH COMPONENTS
class ComponentsListScreen extends StatelessWidget {
  const ComponentsListScreen({super.key});

  // Danh sách các component cần hiển thị
  final List<Map<String, String>> uiComponents = const [
    {'title': 'Text', 'subtitle': 'Displays text', 'type': 'Display'},
    {'title': 'Image', 'subtitle': 'Displays an image', 'type': 'Display'},
    {'title': 'TextField', 'subtitle': 'Input field for text', 'type': 'Input'},
    {'title': 'PasswordField', 'subtitle': 'Input field for passwords', 'type': 'Input'},
    {'title': 'Column', 'subtitle': 'Arranges elements vertically', 'type': 'Layout'},
    {'title': 'Row', 'subtitle': 'Arranges elements horizontally', 'type': 'Layout'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Components List'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue, // Màu chữ và icon
      ),
      body: ListView(
        padding: const EdgeInsets.all(15.0),
        children: _buildComponentList(context),
      ),
    );
  }

  // Hàm xây dựng danh sách (ListTiles)
  List<Widget> _buildComponentList(BuildContext context) {
    final List<Widget> widgets = [];
    String? currentType;

    for (final component in uiComponents) {
      // 1. Thêm Tiêu đề nhóm (Display, Input, Layout)
      if (component['type'] != currentType) {
        currentType = component['type'];
        widgets.add(
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 8.0),
            child: Text(
              currentType!,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        );
      }

      // 2. Thêm ListTile cho mỗi component
      widgets.add(
        Card(
          elevation: 0,
          margin: const EdgeInsets.symmetric(vertical: 4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            tileColor: const Color.fromARGB(255, 114, 169, 208),
            title: Text(component['title']!),
            subtitle: Text(component['subtitle']!),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Chuyển sang màn hình chi tiết và truyền tên component
              Navigator.pushNamed(
                context,
                '/detail',
                arguments: component['title']!,
              );
            },
          ),
        ),
      );
    }
    return widgets;
  }
}

// 4. MÀN HÌNH CHI TIẾT (DETAIL SCREEN)
class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

    // Widget tạo ra một ô vuông màu
  Widget _buildGridItem(Color color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8.0), // Khoảng cách giữa các ô
        height: 60, // Chiều cao cố định cho mỗi ô
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10), // Bo góc
        ),
      ),
    );
  }

  // Hàm giả lập nội dung chi tiết dựa trên tên component
  Widget _getDetailContent(String componentName) {
    switch (componentName) {
      case 'Text':
        return const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text.rich(
            TextSpan(
              text: 'The ',
              style: TextStyle(fontSize: 24, height: 1.5),
              children: <TextSpan>[
                TextSpan(text: 'quick', style: TextStyle(decoration: TextDecoration.lineThrough)),
                TextSpan(text: ' B', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF964B00), fontSize: 26)),
                TextSpan(text: 'rown', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF964B00))),
                TextSpan(text: ' fox'),
                TextSpan(text: ' jumps', style: TextStyle(letterSpacing: 5)),
                TextSpan(text: ' over', style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: ' the', style: TextStyle(decoration: TextDecoration.underline)),
                TextSpan(text: ' lazy', style: TextStyle(fontFamily: "DancingScript")),
                TextSpan(text: ' dog.'),
              ],
            ),
          ),
        );
      case 'Image':
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 16.0),
                width: 250,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blue, width: 2),
                ),
            child: Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/%E1%BA%A2nh_m%E1%BA%B7t_tr%C6%B0%E1%BB%9Bc_%C4%90H_GTVT_TP_HCM.jpg/250px-%E1%BA%A2nh_m%E1%BA%B7t_tr%C6%B0%E1%BB%9Bc_%C4%90H_GTVT_TP_HCM.jpg',
              fit: BoxFit.cover, // Cắt ảnh để vừa với kích thước đã định
            ),
          ),
          Container(
                margin: const EdgeInsets.only(bottom: 16.0),
                width: 250,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blue, width: 2),
                ),
            child: Image.network(
              'https://image.plo.vn/1200x630/Uploaded/2025/xqeioxdexq/2025_05_18/1000011633-9970-7187.jpg',
              fit: BoxFit.cover, // Cắt ảnh để vừa với kích thước đã định
            ),
          ),
          ],
          ),
        );
      case 'TextField':
        return const Padding(
          padding: EdgeInsets.all(20.0),
          child: TextField(decoration: InputDecoration(labelText: 'Thông tin nhập', border: OutlineInputBorder())),
        );
      case 'Row':
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              // Hàng 1
              Row(children: <Widget>[
                _buildGridItem(Colors.blue.shade200),
                _buildGridItem(Colors.blue.shade600),
                _buildGridItem(Colors.blue.shade200),
              ]),
              // Hàng 2
              Row(children: <Widget>[
                _buildGridItem(Colors.blue.shade200),
                _buildGridItem(Colors.blue.shade600),
                _buildGridItem(Colors.blue.shade200),
              ]),
              // Hàng 3
              Row(children: <Widget>[
                _buildGridItem(Colors.blue.shade200),
                _buildGridItem(Colors.blue.shade600),
                _buildGridItem(Colors.blue.shade200),
              ]),
              // Hàng 4
              Row(children: <Widget>[
                _buildGridItem(Colors.blue.shade200),
                _buildGridItem(Colors.blue.shade600),
                _buildGridItem(Colors.blue.shade200),
              ]),
            ],
          ),
        );
      default:
        return Center(child: Text('Chi tiết về $componentName đang được cập nhật.'));
    }
  }

  @override
  Widget build(BuildContext context) {
    // Lấy tên component được truyền từ màn hình trước
    final componentName = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('$componentName ',),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: const Color.fromARGB(255, 120, 165, 237),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _getDetailContent(componentName),
          ],
        ),
      ),
    );
  }
}
