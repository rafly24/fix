// lib/features/personal_info/bindings/personal_info_binding.dart
import 'package:get/get.dart';
import '../controllers/personal_info_controller.dart';

class PersonalInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PersonalInfoController());
  }
}