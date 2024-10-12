import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  final emailRecommendations = true.obs;
  final chatNotifications = true.obs;

  void toggleEmailRecommendations() => emailRecommendations.toggle();
  void toggleChatNotifications() => chatNotifications.toggle();

  void showDeleteConfirmationDialog() {
    Get.dialog(
      AlertDialog(
        title: Text('Are you sure you want to delete your account from RaKo?'),
        content: Text('Once you delete this account all the data will be lost and unable to recover!'),
        actions: [
          TextButton(
            child: Text('Back'),
            onPressed: () => Get.back(),
            style: TextButton.styleFrom(foregroundColor: Colors.black),
          ),
          TextButton(
            child: Text('Delete'),
            onPressed: () {
              // Handle account deletion logic here
              Get.back(); // Close the dialog after confirming
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }
}