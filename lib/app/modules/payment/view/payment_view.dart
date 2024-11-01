import '../controller/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class PaymentView extends GetView<PaymentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Get.back(),
        ),
        title: Text('Payment'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Stepper (sama seperti checkout)
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                _buildStepIndicator(1, 'Pengajuan', true),
                _buildStepLine(),
                _buildStepIndicator(2, 'Pemilik\nmenyetujui', true),
                _buildStepLine(),
                _buildStepIndicator(3, 'Pembayaran\nawal', true),
                _buildStepLine(),
                _buildStepIndicator(4, 'Berhasil\nbooking', false),
              ],
            ),
          ),
          
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('No. Invoice'),
                Text('123456789098765432'),
                SizedBox(height: 16),
                
                Text('Type of Payment'),
                Text('Check-in room for 1 month'),
                SizedBox(height: 16),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Payment Method'),
                    TextButton(
                      onPressed: () {
                        // Tambahkan logika untuk edit payment method
                      },
                      child: Text('Edit', style: TextStyle(color: Colors.green)),
                    ),
                  ],
                ),
                Text('Bank Negara Indonesia'),
                
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total Paid'),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '500.000',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Tambahkan logika untuk see details
                          },
                          child: Text(
                            'See details',
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          Spacer(),
          Padding(
            padding: EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () => controller.processPayment(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: Size(double.infinity, 45),
              ),
              child: Text('Pay Now'),
            ),
          ),
        ],
      ),
    );
  }
}
// Tambahkan method ini di dalam class PaymentView
Widget _buildStepIndicator(int step, String label, bool isActive) {
  return Expanded(
    child: Column(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive ? Colors.green : Colors.grey.shade300,
          ),
          child: Center(
            child: Text(
              step.toString(),
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            color: isActive ? Colors.green : Colors.grey,
          ),
        ),
      ],
    ),
  );
}

Widget _buildStepLine() {
  return Expanded(
    child: Container(
      height: 1,
      color: Colors.grey.shade300,
    ),
  );
}