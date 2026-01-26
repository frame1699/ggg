import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("🔥 เมนูยอดนิยม", style: TextStyle(fontSize: 22)),
      ),
    );
  }
}
