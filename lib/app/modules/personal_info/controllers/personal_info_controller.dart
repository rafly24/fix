import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';
import '../../profile/controllers/profile_controller.dart';

class PersonalInfoController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Observable variables
  final fullName = ''.obs;
  final gender = ''.obs;
  final dateOfBirth = ''.obs;
  final work = ''.obs;
  final contactNumber = ''.obs;
  var profileImagePath = ''.obs;
  var profileImageUrl = ''.obs;
  var isProfileImageChanged = false.obs;
  var isLoading = false.obs;

  final ImagePicker _picker = ImagePicker();
  final ProfileController profileController = Get.find<ProfileController>();

  @override
  void onInit() {
    super.onInit();
    loadUserData();
    // Pastikan ProfileController sudah ter-inject
    if (!Get.isRegistered<ProfileController>()) {
      Get.put(ProfileController());
    }
  }

  // Load user data from Firestore
  Future<void> loadUserData() async {
    try {
      isLoading.value = true;
      String? userId = _auth.currentUser?.uid;

      if (userId != null) {
        DocumentSnapshot doc =
            await _firestore.collection('profile').doc(userId).get();

        if (doc.exists) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          fullName.value = data['fullName'] ?? '';
          gender.value = data['gender'] ?? '';
          dateOfBirth.value = data['dateOfBirth'] ?? '';
          work.value = data['work'] ?? '';
          contactNumber.value = data['contactNumber'] ?? '';
          profileImageUrl.value = data['profileImageUrl'] ?? '';
        }
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to load user data',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.1),
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Upload image to Firebase Storage
  Future<String?> _uploadImage(String filePath) async {
    try {
      String userId = _auth.currentUser!.uid;
      String fileName = 'profile_images/$userId.jpg';
      File file = File(filePath);

      await _storage.ref(fileName).putFile(file);
      String downloadUrl = await _storage.ref(fileName).getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }

  // Change photo implementation
  Future<void> changePhoto() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        profileImagePath.value = pickedFile.path;
        isProfileImageChanged.value = true;

        // Upload image immediately after picking
        String? imageUrl = await _uploadImage(pickedFile.path);
        if (imageUrl != null) {
          profileImageUrl.value = imageUrl;
          // Update profile image URL in Firestore
          await _updateProfileField('profileImageUrl', imageUrl);

          Get.snackbar(
            'Success',
            'Profile photo updated successfully',
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to update profile photo',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.1),
      );
    }
  }

  // Update single field in Firestore
  Future<void> _updateProfileField(String field, dynamic value) async {
    try {
      String userId = _auth.currentUser!.uid;
      await _firestore.collection('profile').doc(userId).update({
        field: value,
      });
    } catch (e) {
      throw Exception('Failed to update $field');
    }
  }

  // Save all personal information
  Future<void> savePersonalInfo() async {
    try {
      isLoading.value = true;
      String userId = _auth.currentUser!.uid;

      Map<String, dynamic> profileData = {
        'fullName': fullName.value,
        'gender': gender.value,
        'dateOfBirth': dateOfBirth.value,
        'work': work.value,
        'contactNumber': contactNumber.value,
        'profileImageUrl': profileImageUrl.value,
        'updatedAt': FieldValue.serverTimestamp(),
      };

      await _firestore.collection('profile').doc(userId).set(
            profileData,
            SetOptions(merge: true),
          );

      // Update ProfileController
      profileController.loadUserData();

      Get.snackbar(
        'Success',
        'Personal information saved successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.1),
      );
      Get.back();
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to save personal information',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.1),
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Existing methods for UI interaction
  final List<String> genderOptions = ['Male', 'Female', 'Other'];
  final List<String> workOptions = [
    'Employee',
    'Self-Employed',
    'Business Owner',
    'Student',
    'Other'
  ];

  void showGenderPicker() {
    Get.bottomSheet(
      Container(
        color: Colors.white,
        child: ListView(
          shrinkWrap: true,
          children: genderOptions.map((String value) {
            return ListTile(
              title: Text(value),
              onTap: () {
                updateGender(value);
                Get.back();
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  void showWorkPicker() {
    Get.bottomSheet(
      Container(
        color: Colors.white,
        child: ListView(
          shrinkWrap: true,
          children: workOptions.map((String value) {
            return ListTile(
              title: Text(value),
              onTap: () {
                updateWork(value);
                Get.back();
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  void showDatePicker() async {
    final DateTime? picked = await Get.dialog(
      DatePickerDialog(
        initialDate: DateTime(1996, 2, 29),
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      ),
    );

    if (picked != null) {
      final String formattedDate = '${picked.day.toString().padLeft(2, '0')}-'
          '${picked.month.toString().padLeft(2, '0')}-'
          '${picked.year.toString()}';
      updateDateOfBirth(formattedDate);
    }
  }

  // Update methods that now update Firestore
  void updateGender(String newGender) async {
    gender.value = newGender;
    await _updateProfileField('gender', newGender);
  }

  void updateWork(String newWork) async {
    work.value = newWork;
    await _updateProfileField('work', newWork);
  }

  void updateDateOfBirth(String newDate) async {
    dateOfBirth.value = newDate;
    await _updateProfileField('dateOfBirth', newDate);
  }

  void updateFullName(String newName) async {
    fullName.value = newName;
    await _updateProfileField('fullName', newName);
  }

  void updateContactNumber(String newNumber) async {
    contactNumber.value = newNumber;
    await _updateProfileField('contactNumber', newNumber);
  }
}
