import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class PersonalInfoController extends GetxController {
  final fullName = 'Muhammad Rizki'.obs;
  final gender = 'Male'.obs;
  final dateOfBirth = '29-02-1996'.obs;
  final work = 'Employee'.obs;
  final contactNumber = '+62 8830437722'.obs;

  var profileImagePath = ''.obs;  // Path gambar profil
  var isProfileImageChanged = false.obs; // Tambahkan ini
  final ImagePicker _picker = ImagePicker();  // ImagePicker instance

  Future<void> changePhoto() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);  // Mengambil gambar dari galeri
    if (pickedFile != null) {
      profileImagePath.value = pickedFile.path;  // Simpan path gambar
      isProfileImageChanged.value = true; // Set variabel ini ke true
      Get.snackbar(
        'Photo Change',
        'Profile photo updated successfully',
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      Get.snackbar(
        'Photo Change',
        'No photo selected',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void savePersonalInfo() {
    // Implementasi logika penyimpanan
    Get.snackbar(
      'Success',
      'Personal information saved successfully',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.withOpacity(0.1),
    );
    Get.back();
  }

  // List dropdown
  final List<String> genderOptions = ['Male', 'Female', 'Other'];
  final List<String> workOptions = ['Employee', 'Self-Employed', 'Business Owner', 'Student', 'Other'];

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
      final String formattedDate =
          '${picked.day.toString().padLeft(2, '0')}-'
          '${picked.month.toString().padLeft(2, '0')}-'
          '${picked.year.toString()}';
      updateDateOfBirth(formattedDate);
    }
  }

  // Metode untuk memperbarui nilai
  void updateGender(String newGender) {
    gender.value = newGender;  // Memperbarui gender
  }

  void updateWork(String newWork) {
    work.value = newWork;  // Memperbarui pekerjaan
  }

  void updateDateOfBirth(String newDate) {
    dateOfBirth.value = newDate;  // Memperbarui tanggal lahir
  }

  // Metode untuk memperbarui nama lengkap dan nomor kontak
  void updateFullName(String newName) {
    fullName.value = newName;  // Memperbarui nama lengkap
  }

  void updateContactNumber(String newNumber) {
    contactNumber.value = newNumber;  // Memperbarui nomor kontak
  }
}