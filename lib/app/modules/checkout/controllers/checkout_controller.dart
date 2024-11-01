import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manajement_kost/app/routes/app_routes.dart';

class CheckoutController extends GetxController {
  // Observable variables
  final _selectedDate = DateTime.now().obs;
  final _totalPayment = 500000.0.obs;
  final _currentStep = 0.obs;
  final _voucherCode = ''.obs;
  final _kosName = 'Kos dekat UMM'.obs;
  final _location = 'Jl. Raya Jetis'.obs;
  final _facilities = 'Meja - Lemari - Kasur'.obs;

  // Getters
  DateTime get selectedDate => _selectedDate.value;
  double get totalPayment => _totalPayment.value;
  int get currentStep => _currentStep.value;
  String get voucherCode => _voucherCode.value;
  String get kosName => _kosName.value;
  String get location => _location.value;
  String get facilities => _facilities.value;

  // Setters
  void updateDate(DateTime date) {
    _selectedDate.value = date;
  }

  void updateStep(int step) {
    _currentStep.value = step;
  }

  void applyVoucher(String code) {
    _voucherCode.value = code;
    // Implementasi logika voucher disini
    calculateTotal();
  }

  void calculateTotal() {
    // Implementasi perhitungan total dengan voucher
    // Contoh sederhana:
    _totalPayment.value = 500000.0;
    if (_voucherCode.value.isNotEmpty) {
      // Aplikasikan diskon jika ada voucher
      // _totalPayment.value = _totalPayment.value * 0.9; // Contoh diskon 10%
    }
  }

  void processCheckout() {
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
                'Rental application submitted successfully',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Rental application has been approved by\nthe owner successfully!',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Get.back(); // Tutup dialog
                  Get.toNamed(AppRoutes.PAYMENT); // Navigasi ke halaman payment
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: Size(double.infinity, 45),
                ),
                child: Text('Payment'),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  @override
  void onInit() {
    super.onInit();
    // Inisialisasi data awal jika diperlukan
    calculateTotal();
  }
}
