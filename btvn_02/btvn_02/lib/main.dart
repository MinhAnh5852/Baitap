import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kiểm tra email',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MailClassifierScreen(), // Màn hình chính
    );
  }
}

class MailClassifierScreen extends StatefulWidget {
  const MailClassifierScreen({super.key});

  @override
  State<MailClassifierScreen> createState() => _MailClassifierScreenState();
}

class _MailClassifierScreenState extends State<MailClassifierScreen> {
  // Controllers để lấy dữ liệu từ TextField
  final TextEditingController _mailController = TextEditingController();

  // Biến State để lưu trữ và hiển thị kết quả
  String _classificationResult = '';
  Color _resultColor = Colors.grey;

  // Hàm xử lý khi nhấn "Kiểm tra"
  void _checkMailClassification() {
    // Lấy dữ liệu từ Controllers
    final String mail = _mailController.text.trim();


    // Bắt đầu cập nhật State (Giao diện)
    setState(() {
      
      // Kiểm tra tính hợp lệ của Tuổi
      if (mail.isEmpty) {
        _classificationResult = 'Email không hợp lệ.';
        _resultColor = Colors.red;
      } else if (!mail.contains('@')){
          _classificationResult = 'Email không đúng định dạng';
          _resultColor = Colors.red;
      } else { // 6-65
          _classificationResult = 'Bạn đã nhập email hợp lệ';
          _resultColor = Colors.red;
      } 
    });
  }

  // Giao diện (UI)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text(
              'THỰC HÀNH 02',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 30),

            // Vùng nhập liệu 
            Container(
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: Colors.grey[200], 
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  _buildInputField(
                    controller: _mailController,
                    labelText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            const SizedBox(height: 25),

            // Kết quả
            Center(child: Text(
              _classificationResult,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: _resultColor,
              ),
            ),
            ),
            const SizedBox(height: 25),

            // Nút Kiểm tra
            Center(
              child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _checkMailClassification,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Kiểm tra', style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
            ),
            const SizedBox(height: 40),       
          ],
        ),
      ),
    );
  }
  
  // Hàm xây dựng TextField (giúp code gọn hơn)
  Widget _buildInputField({
    required TextEditingController controller,
    required String labelText,
    required TextInputType keyboardType,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        fillColor: Colors.white,
        filled: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none, // Bỏ viền
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      ),
    );
  }
}
