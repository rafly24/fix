import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/kos_models.dart';
import '../../../routes/app_routes.dart'; // Pastikan import ini benar

class KosListItem extends StatelessWidget {
  final KosModel kos;

  const KosListItem({super.key, required this.kos});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("Navigating to detail..."); // Debug print
        Get.toNamed(AppRoutes.ROOM_DETAIL,
          arguments: {
            'name': kos.name,
            'price': kos.price,
            'description': kos.address, // atau deskripsi lain jika ada
            // 'imageUrl': kos.imageUrl ?? '', // jika ada
          },
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              kos.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              kos.address,
              style: TextStyle(color: Colors.grey[600]),
            ),
            const SizedBox(height: 8),
            Text(
              'Rp ${kos.price}/bln',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}