import 'package:flutter/material.dart';
import '../controllers/room_detail_controller.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RoomDetailWidgets extends StatelessWidget {
  final RoomDetailController controller;

  const RoomDetailWidgets({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Gambar Utama
        Stack(
          children: [
            // Image.network(
            //   controller.imageUrl.value,
            //   width: double.infinity,
            //   height: 250,
            //   fit: BoxFit.cover,
            // ),
            Positioned(
              top: 40,
              left: 10,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Get.back(),
              ),
            ),
          ],
        ),

        // Informasi Kamar
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.title.value,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Rp ${controller.price.value}/bulan',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                controller.description.value,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),

        // Spacer untuk mendorong bottom navigation ke bawah
        const Spacer(),

        // Bottom Navigation
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.grey[300]!),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNavButton(Icons.call, 'Telepon'),
              _buildNavButton(Icons.message, 'Pesan'),
              _buildNavButton(Icons.share, 'Bagikan', onTap: () {
                controller.toggleShareMenu();
              }),
              Obx(() => _buildNavButton(
                    Icons.favorite,
                    'Favorit',
                    color:
                        controller.isFavorite.value ? Colors.red : Colors.grey,
                    onTap: () => controller.toggleFavorite(),
                  )),
            ],
          ),
        ),

        // Share Menu
        Obx(() => controller.isShareMenuVisible.value
            ? Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.grey[300]!),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildShareButton(Icons.copy, 'Salin'),
                    _buildShareButton(
                        FontAwesomeIcons.whatsapp, 'WhatsApp'), // Ubah ini
                    _buildShareButton(
                        FontAwesomeIcons.facebook, 'Facebook'), // Ubah ini
                    _buildShareButton(Icons.more_horiz, 'Lainnya'),
                  ],
                ),
              )
            : const SizedBox()),
      ],
    );
  }

  Widget _buildNavButton(IconData icon, String label,
      {Color? color, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color ?? Colors.grey),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShareButton(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 20),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
