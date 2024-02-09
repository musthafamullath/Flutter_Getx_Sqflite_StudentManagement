import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_management_squflite_getx/core/colors.dart';
import 'package:student_management_squflite_getx/presentation/controllers/student_controller.dart';
import 'package:student_management_squflite_getx/presentation/screens/student%20detail/widgets/custom_material_button.dart';
import 'package:student_management_squflite_getx/presentation/screens/student%20detail/widgets/detail_section.dart';
import 'package:student_management_squflite_getx/presentation/screens/student%20detail/widgets/profile_image_widget.dart';
import '../../../core/constants.dart';

class ScreenStudentDetail extends StatelessWidget {
  ScreenStudentDetail({super.key});
  final int index = Get.arguments;
  final studentController = Get.put(StudentController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Obx(
          () => Stack(
            children: [
              DetailProfileImageWidget(
                studentModel: studentController.allStudent[index],
              ),
              StudentDetailWidget(
                studentModel: studentController.allStudent[index],
              ),
            ],
          ),
        ),
          floatingActionButton: Padding(
          padding: EdgeInsets.zero,
          child: Container(
            color: kWhiteColor,
            padding: EdgeInsets.zero,
            width: kGetWidth,
            height: kGetHeight * 0.075,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomMaterialButton(
                  onTap: () {
                    Get.toNamed(
                      '/screen_student_update',
                      arguments: studentController.allStudent[index],
                    );
                  },
                  text: 'Update Profile',
                ),
                CustomMaterialButton(
                  onTap: () {
                    Get.find<StudentController>()
                        .deleteStudent(studentController.allStudent[index].id!);
                    Get.back();

                    debugPrint('id on deleting: ${studentController.allStudent[index].id!}');
                  },
                  text: 'Remove Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
