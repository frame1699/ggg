import 'package:cloud_firestore/cloud_firestore.dart';
import 'food_data.dart';

List<Food> cart = [];

Future<void> sendOrderToFirebase() async {
  final db = FirebaseFirestore.instance;

  if (cart.isEmpty) return;

  // 1. สร้างรายการอาหารที่จะส่ง (รวบเป็น List ของ Map)
  List<Map<String, dynamic>> items = cart.map((food) {
    return {
      "name": food.name,
      "price": food.price,
      "qty": 1, // หรือจะเพิ่มระบบนับจำนวนในอนาคตก็ได้ครับ
    };
  }).toList();

  // 2. คำนวณราคารวมทั้งหมด
  int totalPrice = cart.fold(0, (sum, item) => sum + item.price);

  // 3. ส่งข้อมูลก้อนเดียวเข้า Firebase (Collection: flag.tab)
  await db.collection("flag.tab").add({
    "items": items, // รายการอาหารทั้งหมดในออเดอร์นี้
    "total": totalPrice, // ราคารวม
    "time": FieldValue.serverTimestamp(), // เวลาสั่งซื้อ
    "status": "pending", // แถมสถานะออเดอร์ให้ด้วยครับ
  });
}
