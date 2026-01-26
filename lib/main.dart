import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // เพิ่มบรรทัดนี้
import 'pages/home_menu_page.dart'; // เปลี่ยนให้เริ่มที่หน้าเมนูหลัก

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // แก้ไขให้ใช้ options จากไฟล์ firebase_options.dart
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Subzero Food Lab',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeMenuPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
