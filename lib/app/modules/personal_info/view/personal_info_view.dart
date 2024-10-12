import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import '../controllers/personal_info_controller.dart';
import '../widgets/custom_text_field.dart';

class PersonalInfoView extends GetView<PersonalInfoController> {
  const PersonalInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Personal Information',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  children: [
                    Obx(() {
                      return CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey[300],
                        backgroundImage: controller.profileImagePath.value.isNotEmpty
                            ? FileImage(File(controller.profileImagePath.value))
                            : null,
                        child: controller.profileImagePath.value.isEmpty
                            ? Icon(Icons.camera_alt, color: Colors.grey[600], size: 40)
                            : null,
                      );
                    }),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Obx(() {
                        return controller.isProfileImageChanged.value
                            ? Container() // Jika foto sudah diubah, tampilkan tidak ada tulisan
                            : GestureDetector(
                          onTap: controller.changePhoto,
                          child: Text(
                            'Change Photo',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 14,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Obx(() => CustomTextField(
                label: 'Full Name',
                initialValue: controller.fullName.value,
                onChanged: controller.updateFullName,
              )),
              Obx(() => CustomTextField(
                label: 'Gender',
                initialValue: controller.gender.value,
                readOnly: true,
                suffixIcon: const Icon(Icons.arrow_drop_down),
                onTap: controller.showGenderPicker,
              )),
              Obx(() => CustomTextField(
                label: 'Date of birth',
                initialValue: controller.dateOfBirth.value,
                readOnly: true,
                suffixIcon: const Icon(Icons.calendar_today, size: 20),
                onTap: controller.showDatePicker,
              )),
              Obx(() => CustomTextField(
                label: 'Work',
                initialValue: controller.work.value,
                readOnly: true,
                suffixIcon: const Icon(Icons.arrow_drop_down),
                onTap: controller.showWorkPicker,
              )),
              Obx(() => CustomTextField(
                label: 'Contact Number',
                initialValue: controller.contactNumber.value,
                keyboardType: TextInputType.phone,
                onChanged: controller.updateContactNumber,
              )),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: controller.savePersonalInfo,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}