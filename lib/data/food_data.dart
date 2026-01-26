class Food {
  final String name;
  final String type;
  final String ingredients;
  final String steps;
  final String imagePath;
  final String videoPath;
  final double lat;
  final double lng;
  final int price;

  Food({
    required this.name,
    required this.type,
    required this.ingredients,
    required this.steps,
    required this.imagePath,
    required this.videoPath,
    required this.lat,
    required this.lng,
    required this.price,
  });
}

List<Food> foods = [
  Food(
    name: "ผัดกะเพรา",
    type: "savory",
    ingredients: "หมู, กะเพรา, พริก, กระเทียม",
    steps: "ผัดทุกอย่างรวมกัน",
    imagePath: "assets/images/111.jpg",
    videoPath: "assets/videos/11.mp4",
    lat: 18.285121640008658,
    lng: 99.50031862284766,
    price: 50,
  ),
  Food(
    name: "ข้าวมันไก่",
    type: "savory",
    ingredients: "ไก่, ข้าว, น้ำจิ้ม",
    steps: "ต้มไก่ หุงข้าว จัดจาน",
    imagePath: "assets/images/222.jpg",
    videoPath: "assets/videos/22.mp4",
    lat: 18.28823188490101,
    lng: 99.50266990672459,
    price: 50,
  ),
  Food(
    name: "ส้มตำ",
    type: "savory",
    ingredients: "มะละกอ, พริก, มะนาว",
    steps: "ตำทุกอย่างรวมกัน",
    imagePath: "assets/images/333.jpg",
    videoPath: "assets/videos/33.mp4",
    lat: 18.28955991030151,
    lng: 99.50535156065501,
    price: 40,
  ),
  Food(
    name: "ก๋วยเตี๋ยว",
    type: "savory",
    ingredients: "เส้น, หมู, น้ำซุป",
    steps: "ลวกเส้น ใส่น้ำซุป",
    imagePath: "assets/images/444.jpg",
    videoPath: "assets/videos/44.mp4",
    lat: 18.28870706268004,
    lng: 99.50515434995226,
    price: 45,
  ),
  Food(
    name: "ไอติม",
    type: "sweet",
    ingredients: "นม, น้ำตาล",
    steps: "แช่แข็ง",
    imagePath: "assets/images/555.jpg",
    videoPath: "assets/videos/55.mp4",
    lat: 18.286009339554823,
    lng: 99.50423064196416,
    price: 25,
  ),
  Food(
    name: "เค้ก",
    type: "sweet",
    ingredients: "แป้ง, ไข่, นม",
    steps: "อบ",
    imagePath: "assets/images/666.jpg",
    videoPath: "assets/videos/66.mp4",
    lat: 18.28698015799451,
    lng: 99.5007418850396,
    price: 30,
  ),
  Food(
    name: "โรตี",
    type: "sweet",
    ingredients: "แป้ง, ไข่, นม",
    steps: "ทอด",
    imagePath: "assets/images/777.jpg",
    videoPath: "assets/videos/77.mp4",
    lat: 18.285826118711103,
    lng: 99.50572802463724,
    price: 25,
  ),
];
