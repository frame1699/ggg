import 'package:flutter/material.dart';
import 'home_page.dart'; // เชื่อมไปหน้าเมนูอาหาร
import 'cart_page.dart'; // เชื่อมไปหน้าตะกร้า
import 'order_page.dart'; // เชื่อมไปหน้าออเดอร์ (ไฟล์ใหม่)

class HomeMenuPage extends StatelessWidget {
  const HomeMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      appBar: AppBar(
        title: const Text("Subzero Food Lab"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16),
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: [
          // 1. ปุ่มเมนูอาหาร
          menuCard(
            context,
            "เมนูอาหาร",
            Icons.restaurant_menu,
            Colors.orange,
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const HomePage()),
              );
            },
          ),

          // 2. ปุ่มวิดีโอสอนทำ (ถ้ายังไม่มีหน้าแยก จะไปหน้าเมนูอาหารก่อน)
          menuCard(
            context,
            "วิดีโอสอนทำ",
            Icons.movie_filter,
            Colors.redAccent,
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const HomePage()),
              );
            },
          ),

          // 3. ปุ่มสูตรอาหาร
          menuCard(context, "สูตรอาหาร", Icons.menu_book, Colors.green, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const HomePage()),
            );
          }),

          // 4. ปุ่มร้านใกล้ฉัน
          menuCard(context, "ร้านใกล้ฉัน", Icons.explore, Colors.blue, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const HomePage()),
            );
          }),

          // 5. ปุ่มตะกร้าของฉัน
          menuCard(
            context,
            "ตะกร้าของฉัน",
            Icons.shopping_basket,
            Colors.purple,
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CartPage()),
              );
            },
          ),

          // 6. ปุ่มออเดอร์ (ดึงข้อมูลจาก Firebase)
          menuCard(context, "ออเดอร์", Icons.rocket_launch, Colors.brown, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const OrderPage()),
            );
          }),
        ],
      ),
    );
  }

  Widget menuCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    VoidCallback tap,
  ) {
    return InkWell(
      onTap: tap,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.75), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.4),
              blurRadius: 10,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 52, color: Colors.white),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
