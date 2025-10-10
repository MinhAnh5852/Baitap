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
      title: 'Bài tập Tuần 02 - Phân loại tuổi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AgeClassifierScreen(), // Màn hình chính
    );
  }
}

class AgeClassifierScreen extends StatefulWidget {
  const AgeClassifierScreen({super.key});

  @override
  State<AgeClassifierScreen> createState() => _AgeClassifierScreenState();
}

class _AgeClassifierScreenState extends State<AgeClassifierScreen> {
  // Controllers để lấy dữ liệu từ TextField
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  // Biến State để lưu trữ và hiển thị kết quả
  String _classificationResult = '';
  Color _resultColor = Colors.grey;

  // Hàm xử lý khi nhấn "Kiểm tra"
  void _checkAgeClassification() {
    // Lấy dữ liệu từ Controllers
    final String name = _nameController.text.trim();
    final String ageText = _ageController.text.trim();

    // Xử lý Input và Logic
    final int? age = int.tryParse(ageText);

    // Bắt đầu cập nhật State (Giao diện)
    setState(() {
      
      // Kiểm tra tính hợp lệ của Tuổi
      if (age == null || age < 0 || name == '') {
        _classificationResult = 'Tên hoặc tuổi nhập vào không hợp lệ.';
        _resultColor = Colors.red;
      } else {
        // Phân loại Tuổi 
        if (age > 65) {
          _classificationResult = '$name là người già';
          _resultColor = Colors.purple;
        } else if (age >= 6) { // 6-65
          _classificationResult = '$name là người lớn';
          _resultColor = Colors.green;
        } else if (age >= 2) { // 2-6
          _classificationResult = '$name là trẻ em';
          _resultColor = Colors.orange;
        } else { // <= 2
          _classificationResult = '$name là em bé';
          _resultColor = Colors.blue;
        }
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
              'THỰC HÀNH 01',
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
                    controller: _nameController,
                    labelText: 'Họ và tên',
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 15),

                  _buildInputField(
                    controller: _ageController,
                    labelText: 'Tuổi',
                    keyboardType: TextInputType.number, // Chỉ cho phép nhập số
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),

            // Nút Kiểm tra
            Center(
              child: SizedBox(
              width: 150,
              height: 50,
              child: ElevatedButton(
                onPressed: _checkAgeClassification,
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

            // Kết quả phân loại
            Text(
              _classificationResult,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: _resultColor,
              ),
            ),
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
