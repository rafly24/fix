// lib/app/modules/Roomdetail/views/homepage_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/homepage_controller.dart';
import '../views/room_detail_view.dart';

class HomepageView extends GetView<HomepageController> {
  const HomepageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> rooms = [
      {
        "image": "asset/th (1).jpeg",
        "title": "Kos Putri Rako kamar besar",
        "price": "500000",
        "description":
            "Kos terjamin aman dekat Universitas Muhammadiyah Malang. Sewa langsung 3, 6, atau 12 bulan, hemat s/d 2.1 jutaan!"
      },
      {
        "image": "asset/th (2).jpeg",
        "title": "Kos Putri Rako kamar kecil",
        "price": "400000",
        "description":
            "Sewa bulanan dengan fasilitas standar dekat kampus dan supermarket."
      },
      {
        "image": "asset/th (3).jpeg",
        "title": "Kos Putri Rako kamar Extra",
        "price": "650000",
        "description":
            "Kamar luas, parkir motor tersedia, dekat pusat perbelanjaan."
      },
      {
        "image": "asset/th.jpeg",
        "title": "Kos Putri Rako kamar Regular",
        "price": "550000",
        "description": "Kamar nyaman dan aman, lingkungan tenang."
      },
    ];

    String? selectedPrice;

    List<Map<String, String>> filteredRooms = rooms.where((room) {
      if (selectedPrice != null) {
        int price = int.parse(room['price']!);
        return price <= int.parse(selectedPrice!);
      }
      return true; // Always return true if selectedPrice is null
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blueAccent.withOpacity(0.1),
              ),
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Filter Kamar",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 10),
                  DropdownButton<String>(
                    hint: const Text("Pilih Harga Maksimal"),
                    value: selectedPrice,
                    isExpanded: true,
                    items: [
                      DropdownMenuItem(value: "400000", child: Text("Rp 400.000")),
                      DropdownMenuItem(value: "500000", child: Text("Rp 500.000")),
                      DropdownMenuItem(value: "600000", child: Text("Rp 600.000")),
                      DropdownMenuItem(value: "700000", child: Text("Rp 700.000")),
                    ],
                    onChanged: (value) {
                      selectedPrice = value;
                      (context as Element).markNeedsBuild();
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: filteredRooms.length,
                itemBuilder: (context, index) {
                  final room = filteredRooms[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: buildRoomCard(
                      room['image'] ?? '', // Use empty string as fallback
                      room['title'] ?? '', 
                      "Rp ${room['price'] ?? '0'} per bulan", // Use '0' if null
                      room['description'] ?? '', 
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRoomCard(
      String imagePath, String roomTitle, String price, String description) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xFFF5F5F5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
              height: 150,
            ),
            const SizedBox(height: 10),
            Text(
              roomTitle,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black, fontSize: 14),
            ),
            const SizedBox(height: 5),
            Text(
              price,
              style: const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: 100,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(RoomDetailView(
                    roomTitle: roomTitle,
                    price: price,
                    description: description,
                    imagePaths: [],
                  ));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE1D5E7),
                  foregroundColor: const Color(0xFF3D3A4E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Get Started",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}