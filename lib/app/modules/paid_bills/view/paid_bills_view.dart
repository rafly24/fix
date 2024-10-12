import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/paid_bills_controller.dart';
import '../../../routes/app_routes.dart';
import '../widgets/paid_bill_item.dart';

class PaidBillsView extends GetView<PaidBillsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: Text('Tagihan Sudah Dibayar', style: TextStyle(color: Colors.black)),
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
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text('Belum dibayar', style: TextStyle(color: Colors.grey)),
                  ),
                ),
                SizedBox(width: 16),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text('Sudah dibayar', style: TextStyle(color: Colors.green)),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() => ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: controller.daftarTagihan.length,
              itemBuilder: (context, index) {
                final tagihan = controller.daftarTagihan[index];
                return PaidBillsItem(tagihan: tagihan);
              },
            )),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(AppRoutes.CHATS),
        child: Icon(Icons.chat),
      ),
    );
  }
}