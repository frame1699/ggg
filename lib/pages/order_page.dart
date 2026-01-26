import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ประวัติออเดอร์"),
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
      ),
      body: StreamBuilder<QuerySnapshot>(
        // ใช้ชื่อ collection "flag.tab" ตามที่ปรากฏใน Firebase ของคุณ
        stream: FirebaseFirestore.instance
            .collection('flag.tab')
            .orderBy('time', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError)
            return Center(child: Text("เกิดข้อผิดพลาด: ${snapshot.error}"));
          if (snapshot.connectionState == ConnectionState.waiting)
            return const Center(child: CircularProgressIndicator());
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty)
            return const Center(child: Text("ยังไม่มีประวัติการสั่งซื้อ"));

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var order = snapshot.data!.docs[index];
              var data = order.data() as Map<String, dynamic>;

              // ดึงรายการอาหาร (Array) ออกมา
              List items = data.containsKey('items') ? data['items'] : [];
              String itemSummary = items.isNotEmpty
                  ? items.map((i) => i['name']).join(", ")
                  : "ไม่มีรายละเอียดเมนู";

              // แปลง Timestamp เป็นวันที่
              String formattedDate = "ไม่ระบุเวลา";
              if (data['time'] != null) {
                DateTime date = (data['time'] as Timestamp).toDate();
                formattedDate = DateFormat('dd/MM/yyyy HH:mm').format(date);
              }

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.receipt_long)),
                  title: Text(
                    itemSummary,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text("สั่งเมื่อ: $formattedDate"),
                  trailing: Text(
                    "${data['total'] ?? 0} บาท",
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
