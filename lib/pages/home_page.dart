import 'package:flutter/material.dart';
import '../data/food_data.dart';
import 'food_detail_page.dart';
import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedType = "savory";

  @override
  Widget build(BuildContext context) {
    final filteredFoods = foods.where((f) => f.type == selectedType).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("เมนูอาหาร"),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CartPage()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ChoiceChip(
                label: const Text("อาหารคาว"),
                selected: selectedType == "savory",
                onSelected: (_) => setState(() => selectedType = "savory"),
              ),
              const SizedBox(width: 10),
              ChoiceChip(
                label: const Text("ของหวาน"),
                selected: selectedType == "sweet",
                onSelected: (_) => setState(() => selectedType = "sweet"),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredFoods.length,
              itemBuilder: (context, index) {
                final food = filteredFoods[index];
                return Card(
                  child: ListTile(
                    leading: Image.asset(food.imagePath, width: 60),
                    title: Text(food.name),
                    subtitle: Text("${food.price} บาท"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => FoodDetailPage(food: food),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
