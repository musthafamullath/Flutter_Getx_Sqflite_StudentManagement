import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_management_squflite_getx/core/assets.dart';
import 'package:student_management_squflite_getx/core/colors.dart';
import 'package:student_management_squflite_getx/core/constants.dart';
import 'package:student_management_squflite_getx/presentation/controllers/image_picker_controller.dart';
import 'package:student_management_squflite_getx/presentation/controllers/student_controller.dart';
import 'package:student_management_squflite_getx/presentation/screens/add%20student/widgets/custom_btn.dart';
import 'package:student_management_squflite_getx/presentation/screens/add%20student/widgets/sections.dart';
class ScreenAddStudent extends StatelessWidget {
  ScreenAddStudent({super.key});
  final studentController = Get.put(StudentController());
  final imagePickerController = Get.put(ImagePickerController());
  final nameController = TextEditingController();
  final dobController = TextEditingController();
  final genderController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final departmentController = TextEditingController();
  final rollNumberController = TextEditingController();
  final studentClassController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                kHeight(kGetHeight * 0.04),
                Obx(
                  () => headAndImageSection(
                    text: "Add New \nStudent Info",
                    onTap: () {
                      imagePickerController.pickImageFromGallery();
                    },
                    image: imagePickerController.image.value.path == ''
                        ? Image.asset(
                            studentImage,
                            fit: BoxFit.fill,
                            filterQuality: FilterQuality.high,
                            color: kAqua,
                          ).image
                        : Image.file(imagePickerController.image.value).image,
                  ),
                ),
                kHeight(kGetHeight * 0.04),
                personalInfoSection(
                  nameController: nameController,
                  dobController: dobController,
                  genderController: genderController,
                  phoneNumberController: phoneNumberController,
                  emailController: emailController,
                ),
                kHeight(kGetHeight * 0.04),
                otherDetailSection(
                  departmentController: departmentController,
                  rollNumberController: rollNumberController,
                  studentClassController: studentClassController,
                ),
                kHeight(kGetHeight * 0.04),
              ],
            ),
          ),
        ),
      ),
        floatingActionButton: CustomAddButton(
        nameController: nameController,
        dobController: dobController,
        genderController: genderController,
        phoneNumberController: phoneNumberController,
        emailController: emailController,
        departmentController: departmentController,
        rollNumberController: rollNumberController,
        studentClassController: studentClassController,
        formkey: formKey,
      ),
     
    );
  }
}
