import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manajement_kost/app/widgets/custom_bottom_nav.dart'; // Import baru
import '../controllers/my_kos_controller.dart';

class MyKosView extends GetView<MyKosController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Kos Saya',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),

                // Greeting
                Obx(() => Text(
                      'Hello ${controller.userName.value}!',
                      style: TextStyle(fontSize: 16),
                    )),

                SizedBox(height: 16),
                Text(
                  'Tempat tinggal anda saat ini',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),

                // Kos Card
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                        child: Image.asset(
                          'assets/kos_image.jpg',
                          width: double.infinity,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    'Wanita',
                                    style: TextStyle(color: Colors.white, fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Obx(() => Text(
                                  controller.kosName.value,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                            Obx(() => Text(
                                  controller.kosAddress.value,
                                  style: TextStyle(color: Colors.grey),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Review Section
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.chat_bubble_outline),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Bagaimana pengalaman kamu di RaKo\nApakah menyenangkan atau justru mengecewakan?\nAyo tulis disini!',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),

                // Activities Section
                SizedBox(height: 24),
                Text(
                  'My Dormitory Activities',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),

                // Menu Grid
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildMenuItem(
                      icon: Icons.description_outlined,
                      label: 'Contract',
                      onTap: controller.onContractTap,
                    ),
                    _buildMenuItem(
                      icon: Icons.payment_outlined,
                      label: 'Pay Bills',
                      onTap: controller.onPayBillsTap,
                    ),
                    _buildMenuItem(
                      icon: Icons.chat_bubble_outline,
                      label: 'Complaint',
                      onTap: controller.onComplaintTap,
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    _buildMenuItem(
                      icon: Icons.headphones_outlined,
                      label: 'Help',
                      onTap: controller.onHelpTap,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      // Ganti bottomNavigationBar lama dengan ini
      bottomNavigationBar: const CustomBottomNav(currentIndex: 1),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 80,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: Colors.black),
            ),
            SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}