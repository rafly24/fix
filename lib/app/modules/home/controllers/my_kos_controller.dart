import 'package:get/get.dart';
class MyKosController extends GetxController {
  final RxString userName = "Muhammad Rizki".obs;
  final RxString kosName = "Kos dekat UMM".obs;
  final RxString kosAddress = "Jl. Raya Jetis".obs;
  
  void onContractTap() {
    // Implementasi untuk menu Contract
    // Get.toNamed(AppRoutes.contract);
  }
  
  void onPayBillsTap() {
    // Implementasi untuk menu Pay Bills
    // Get.toNamed(AppRoutes.payBills);
  }
  
  void onComplaintTap() {
    // Implementasi untuk menu Complaint
    // Get.toNamed(AppRoutes.complaint);
  }
  
  void onHelpTap() {
    // Implementasi untuk menu Help
    // Get.toNamed(AppRoutes.help);
  }
}