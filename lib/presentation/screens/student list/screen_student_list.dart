import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:student_management_squflite_getx/core/colors.dart';
import 'package:student_management_squflite_getx/core/constants.dart';
import 'package:student_management_squflite_getx/presentation/controllers/student_controller.dart';
import 'package:student_management_squflite_getx/presentation/screens/add%20student/widgets/sub_heading.dart';
import 'package:student_management_squflite_getx/presentation/screens/student%20list/widgets/custom_appbar.dart';
import 'package:student_management_squflite_getx/presentation/screens/student%20list/widgets/list_card.dart';

class ScreenStudentList extends StatelessWidget {
  ScreenStudentList({super.key});
  final studentController = Get.put(StudentController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kGetHeight * 0.2),
          child: const CustomAppBarWidget(),
        ),
        body: Obx(() => Center(
              child: studentController.allStudent.isNotEmpty
                  ? ListView.builder(
                      padding: const EdgeInsets.only(bottom: 20),
                      itemCount: studentController.allStudent.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => Get.toNamed('/screen_student_detail',
                              arguments: index),
                          child: ListCardWidget(
                            studentModel: studentController.allStudent[index],
                          ),
                        );
                      },
                    )
                  :  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset("assets/icons/empty_list_image.json",width: 250,height: 250),
                      const SubHeadingWidget(
                          text: "List is Empty!!!",
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: kAmber),
                    ],
                  ),
            )),
      ),
    );
  }
}
