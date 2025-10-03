import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

// Widget gốc
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Tắt banner "Debug"
      title: 'Bài tập Tuần 1 - Profile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProfileScreen(), // Màn hình Profile chính
    );
  }
}

// Màn hình Profile
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Thanh điều hướng
      appBar: AppBar(
        backgroundColor: Colors.white, 
        // Độ cao bóng đổ 
        elevation: 0, 
        
        // Icon mũi tên quay lại
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {}, // Xử lý khi nhấn
        ),
        
        // Icon Edit
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.green),
            onPressed: () {}, // Xử lý khi nhấn
          ),
        ],
      ),
      
      // Nội dung màn hình
      body: Container(
        color: Colors.white, 
        padding: const EdgeInsets.all(20.0), 
        child: Column(
          // Căn chỉnh nội dung ở trung tâm 
          crossAxisAlignment: CrossAxisAlignment.center, 
          children: <Widget>[
            const SizedBox(height: 50),

            // Ảnh đại diện
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle, 
                border: Border.all(color: Colors.grey.shade300, width: 2), 
                image: const DecorationImage(
                  image: NetworkImage('https://scontent.fsgn21-1.fna.fbcdn.net/v/t39.30808-6/349319615_289620350088015_7700276076770322149_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=ZuoCA2SRc5wQ7kNvwGosgvc&_nc_oc=Adli3hDfKIyg_yYLS_9v3NiG64mQnFk27x0SPDXsUXWErGVC7OasUJkum10WOJ09UOJccKr6sD7mR9-crEZU-vHG&_nc_zt=23&_nc_ht=scontent.fsgn21-1.fna&_nc_gid=1Jsrx5AvZ-e1sd_MwoyN5g&oh=00_AfenuZahsXDELFTv1RjNkEK4uTpYCCBBbVOpNFcl5YhbSw&oe=68E5DA1A'), 
                  fit: BoxFit.cover,
                ),
              ),
            ),
            
            // Khoảng trống
            const SizedBox(height: 20),

            // Tên
            const Text(
              'Pham Ngoc Minh Anh',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            
            // Địa điểm
            const Text(
              'Trường Đại học Giao Thông Vận Tải',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const Spacer(), 
          ],
        ),
      ),
    );
  }
}