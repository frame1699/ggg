import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/food_data.dart';
import '../data/cart_data.dart';

class FoodDetailPage extends StatefulWidget {
  final Food food;
  const FoodDetailPage({super.key, required this.food});

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.food.videoPath)
      ..initialize().then((_) {
        if (mounted) setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void openMap() async {
    final String googleMapsUrl =
        "https://www.google.com/maps/search/?api=1&query=${widget.food.lat},${widget.food.lng}";
    final Uri uri = Uri.parse(googleMapsUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final food = widget.food;
    return Scaffold(
      appBar: AppBar(title: Text(food.name)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (_controller.value.isInitialized)
              AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
            IconButton(
              icon: Icon(
                _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
              ),
              onPressed: () {
                setState(() {
                  _controller.value.isPlaying
                      ? _controller.pause()
                      : _controller.play();
                });
              },
            ),
            ListTile(
              title: const Text("วัตถุดิบ"),
              subtitle: Text(food.ingredients),
            ),
            ListTile(title: const Text("วิธีทำ"), subtitle: Text(food.steps)),
            ListTile(
              title: const Text("ราคา"),
              subtitle: Text("${food.price} บาท"),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: openMap,
              icon: const Icon(Icons.location_on),
              label: const Text("ดูร้านบนแผนที่"),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                cart.add(food);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("เพิ่มลงตะกร้าแล้ว"),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
              icon: const Icon(Icons.add_shopping_cart),
              label: const Text("เพิ่มลงตะกร้า"),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
