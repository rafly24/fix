import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';
import '../controllers/profile_controller.dart';
import '../widgets/profile_tile.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Profile',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Profile Info with Gradient and Shadow
            Container(
              margin: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.white, Color(0xFFE5E5E5)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.grey[300],
                      child: const Icon(Icons.person, size: 30),
                    ),
                    title: Obx(() => Text(
                      controller.username.value,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )),
                    subtitle: Obx(() => Text(controller.phoneNumber.value)),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => Get.toNamed(AppRoutes.PERSONAL_INFO),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Obx(() => LinearProgressIndicator(
                          value: controller.profileCompletion.value,
                          backgroundColor: Colors.grey[200],
                          valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                        )),
                        const SizedBox(height: 8),
                        Obx(() => Text(
                          '${controller.filledFields}/${controller.totalFields} Profile data is filled in',
                          style: TextStyle(color: Colors.grey[600], fontSize: 12),
                        )),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Submission and Transaction History
            ProfileTile(
              icon: Icons.home,
              title: 'Submission history',
              onTap: () => Get.toNamed(AppRoutes.RIWAYAT_KOST_NONE),
            ),
            ProfileTile(
              icon: Icons.history,
              title: 'Transaction history',
              onTap: () => Get.toNamed(AppRoutes.TRANSACTION_HISTORY),
            ),
            ProfileTile(
              icon: Icons.settings,
              title: 'Setting',
              onTap: () => Get.toNamed(AppRoutes.SETTINGS),
            ),
            // Log Out with Red Text
            ProfileTile(
              icon: Icons.logout,
              title: 'Log out account',
              textColor: Colors.red,
              onTap: () => _showLogOutConfirmationDialog(context),
            ),
            const Spacer(),
            // Bottom Navigation Bar
            Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () => Get.toNamed(AppRoutes.HOMEPAGE),
                  ),
                  IconButton(
                    icon: const Icon(Icons.home),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.chat_bubble_outline),
                    onPressed: () => Get.toNamed(AppRoutes.CHATS),
                  ),
                  IconButton(
                    icon: const Icon(Icons.person, color: Colors.green),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLogOutConfirmationDialog(BuildContext context) {
    Get.dialog(
      AlertDialog(
        title: const Text('Confirmation'),
        content: const Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
            onPressed: () => Get.back(), // Close the dialog
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              controller.logOut(); // Call the logOut method
              Get.back(); // Close the dialog
            },
            child: const Text('Log out', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}