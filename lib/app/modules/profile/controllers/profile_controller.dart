import 'package:get/get.dart';

class ProfileController extends GetxController {
  var username = 'Rizki'.obs;
  var phoneNumber = '+92-321-1234567'.obs;
  var profileCompletion = 0.6.obs; // 60% completion
  var filledFields = 6.obs;
  var totalFields = 10.obs;

  void logOut() {
    // Logic for logging out
    print('User logged out');
  }
}