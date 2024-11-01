import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';
class PaymentController extends GetxController {
  void processPayment() {
    Get.dialog(
      Dialog(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 60,
              ),
              SizedBox(height: 16),
              Text(
                'Thank You!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Payment done successfully',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                'We will let you know when the owner verifies\nyour payment',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 20),
              OutlinedButton(
                onPressed: () => Get.offAllNamed(AppRoutes.HOMEPAGE),
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(double.infinity, 45),
                ),
                child: Text('Back to Home Page'),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }
}