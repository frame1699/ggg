import 'package:flutter/material.dart';
import '../data/cart_data.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ตะกร้าของฉัน")),
      body: cart.isEmpty
          ? const Center(child: Text("ตะกร้าว่างเปล่า"))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final food = cart[index];
                      return ListTile(
                        title: Text(food.name),
                        subtitle: Text("${food.price} บาท"),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => setState(() => cart.removeAt(index)),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(
                        200,
                        50,
                      ), // จุดที่เคยแดง แก้ให้แล้วครับ
                    ),
                    onPressed: () async {
                      try {
                        await sendOrderToFirebase();
                        setState(() => cart.clear());
                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("ส่งคำสั่งซื้อเรียบร้อย!"),
                            ),
                          );
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("เกิดข้อผิดพลาด: $e")),
                        );
                      }
                    },
                    child: const Text("ยืนยันการสั่งซื้อ"),
                  ),
                ),
              ],
            ),
    );
  }
}
