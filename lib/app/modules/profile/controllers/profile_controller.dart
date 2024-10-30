import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:manajement_kost/app/routes/app_routes.dart';

class ProfileController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  var username = ''.obs;
  var phoneNumber = ''.obs;
  var profileCompletion = 0.6.obs;
  var filledFields = 6.obs;
  var totalFields = 10.obs;
  var profileImageUrl = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

  Future<void> loadUserData() async {
    try {
      String? userId = _auth.currentUser?.uid;
      if (userId != null) {
        DocumentSnapshot doc =
            await _firestore.collection('profile').doc(userId).get();

        if (doc.exists) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          username.value = data['fullName'] ?? '';
          phoneNumber.value = data['contactNumber'] ?? '';
          profileImageUrl.value = data['profileImageUrl'] ?? '';
          calculateProfileCompletion(data);
        }
      }
    } catch (e) {
      print('Error loading user data: $e');
    }
  }

  void calculateProfileCompletion(Map<String, dynamic> data) {
    int filled = 0;
    int total = 0;

    // List of fields to check
    final fieldsToCheck = [
      'fullName',
      'gender',
      'dateOfBirth',
      'work',
      'contactNumber',
      'profileImageUrl'
    ];

    for (var field in fieldsToCheck) {
      total++;
      if (data[field] != null && data[field].toString().isNotEmpty) {
        filled++;
      }
    }

    filledFields.value = filled;
    totalFields.value = total;
    profileCompletion.value = filled / total;
  }

  Future<void> logOut() async {
    try {
      await _auth.signOut();
      clearUserData();
      Get.toNamed(AppRoutes.LOGIN); // Navigate to sign in screen
    } catch (e) {
      Get.snackbar('Error', 'Failed to logout: $e');
    }
  }

  void clearUserData() {
    username.value = '';
    phoneNumber.value = '';
    profileCompletion.value = 0.0;
    filledFields.value = 0;
    profileImageUrl.value = '';
  }

  // Listen to profile changes
  void startListeningToProfileChanges() {
    String? userId = _auth.currentUser?.uid;
    if (userId != null) {
      _firestore
          .collection('profile')
          .doc(userId)
          .snapshots()
          .listen((DocumentSnapshot snapshot) {
        if (snapshot.exists) {
          Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
          username.value = data['fullName'] ?? '';
          phoneNumber.value = data['contactNumber'] ?? '';
          profileImageUrl.value = data['profileImageUrl'] ?? '';
          calculateProfileCompletion(data);
        }
      });
    }
  }
}
