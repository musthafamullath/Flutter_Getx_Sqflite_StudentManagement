import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_management_squflite_getx/data/model/student.dart';
import 'package:student_management_squflite_getx/presentation/controllers/image_picker_controller.dart';
import 'package:student_management_squflite_getx/presentation/controllers/student_controller.dart';

import '../../../../core/colors.dart';
import '../../../../core/constants.dart';

class CustomAddButton extends StatelessWidget {
  CustomAddButton({
    super.key,
    required this.nameController,
    required this.dobController,
    required this.genderController,
    required this.phoneNumberController,
    required this.emailController,
    required this.departmentController,
    required this.rollNumberController,
    required this.studentClassController,
    required this.formkey,
  });

  final TextEditingController nameController;
  final TextEditingController dobController;
  final TextEditingController genderController;
  final TextEditingController phoneNumberController;
  final TextEditingController emailController;
  final TextEditingController departmentController;
  final TextEditingController rollNumberController;
  final TextEditingController studentClassController;
  final GlobalKey<FormState> formkey;

  final imagePickerController = Get.put(ImagePickerController());
  final studentController = Get.put(StudentController());
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: kGetWidth * 0.25,
      height: kGetHeight * 0.07,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        
      ),
      color: kAquarop,
      onPressed: () {
        int id = DateTime.now().millisecondsSinceEpoch;
        if (formkey.currentState!.validate() &&
            imagePickerController.image.value.path != '') {
          studentController.addStudent(
            StudentModel(
              id: id,
              name: nameController.text,
              dob: dobController.text,
              gender: genderController.text,
              phoneNumber: phoneNumberController.text,
              emailAddress: emailController.text,
              profile: imagePickerController.image.value.path,
              department: departmentController.text,
              rollNumber: rollNumberController.text,
              studentClass: studentClassController.text,
            ),
          );
          Get.back();
          kGetSnackbar("New Student details added");
        } else {
          kGetSnackbar("Must fill all field including Profile");
        }
      },
      child: const Text(
        "Create",
        style: TextStyle(
          color: kWhiteColor,
          fontSize: 15,
        ),
      ),
    );
  }
}
