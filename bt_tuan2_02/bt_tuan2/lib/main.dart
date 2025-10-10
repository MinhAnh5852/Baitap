import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bài tập Thực hành 2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NumberInputScreen(),
    );
  }
}

class NumberInputScreen extends StatefulWidget {
  const NumberInputScreen({super.key});

  @override
  State<NumberInputScreen> createState() => _NumberInputScreenState();
}

class _NumberInputScreenState extends State<NumberInputScreen> {
  // Controller để lấy giá trị từ TextField
  final TextEditingController _controller = TextEditingController();
  
  // Biến lưu trữ thông báo lỗi
  String _errorMessage = '';
  int _count = 0;
  // hàm xử lý khi nhấn "Tạo"
  void _processInput() {
    // Lấy giá trị từ ô nhập liệu
    final String inputText = _controller.text;
    // Đặt lại trạng thái lỗi và số lượng mặc định
    setState(() {
      _errorMessage = '';
      _count = 0;
    });

    // Kiểm tra tính hợp lệ của Input
    final int? number = int.tryParse(inputText);

    if (number == null || number <= 0) {
      setState(() {
        _errorMessage = 'Dữ liệu bạn nhập không hợp lệ';
      });
    } else {
      setState(() {
        _count = number;
      });
    }
  }

  // HÀM TẠO DANH SÁCH CÁC MỤC (Widget)
  Widget _buildList(int count) {
    if (count == 0) return const SizedBox.shrink();

    // Tạo ra một danh sách các Widget dựa trên số lượng (_count)
    return Column(
      children: List.generate(count, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Container(
            height: 50,
            width: double.infinity, // Chiếm toàn bộ chiều rộng
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.red, 
              borderRadius: BorderRadius.circular(30),
            ),
            // Hiển thị số thứ tự (index + 1)
            child: Text(
              '${index + 1}',
              style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Number'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text(
              'Thực hành 02',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            ),
            const SizedBox(height: 20),

            // Hàng chứa Ô nhập liệu và Nút bấm
            Row(
              children: <Widget>[
                // Ô nhập liệu (TextField)
                Expanded(
                  child: TextField(
                    controller: _controller,
                    keyboardType: TextInputType.number, // Chỉ cho phép nhập số
                    decoration: const InputDecoration(
                      hintText: 'Nhập vào số lượng',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),

                // Nút bấm "Tạo"
                SizedBox(
                  height: 58,
                  child: ElevatedButton(
                    onPressed: _processInput, // hàm xử lý
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Tạo', style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Hiển thị Thông báo lỗi
            if (_errorMessage.isNotEmpty)
              Center(
                child: Text(
                _errorMessage,
                style: const TextStyle(color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold, ),
                ),
              ),              

            // Vùng hiển thị Danh sách
            _buildList(_count),
          ],
        ),
      ),
    );
  }
}