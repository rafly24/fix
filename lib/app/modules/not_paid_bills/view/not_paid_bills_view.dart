import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';
import '../controllers/not_paid_bills_controller.dart';
import '../widgets/not_paid_bill_item.dart';

class NotPaidBillsView extends GetView<NotPaidBillsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: Text('Your Bills', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => controller.toggleFilter(false),
                    child: Text('Not yet paid'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.green,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Get.toNamed(AppRoutes.PAID_BILLS),
                    child: Text('Already paid'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() => ListView.builder(
              itemCount: controller.bills.length,
              itemBuilder: (context, index) {
                return NotPaidBillItem(bill: controller.bills[index]);
              },
            )),
          ),
        ],
      ),
    );
  }
}