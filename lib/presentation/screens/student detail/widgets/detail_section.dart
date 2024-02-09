import 'package:flutter/material.dart';
import 'package:student_management_squflite_getx/core/colors.dart';
import 'package:student_management_squflite_getx/core/constants.dart';
import 'package:student_management_squflite_getx/data/model/student.dart';
import 'package:student_management_squflite_getx/presentation/screens/student%20detail/widgets/info_widget.dart';
import 'package:student_management_squflite_getx/presentation/screens/student%20detail/widgets/main_title.dart';

class StudentDetailWidget extends StatelessWidget {
  const StudentDetailWidget({super.key, required this.studentModel});
  final StudentModel studentModel;
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      maxChildSize: 0.8,
      minChildSize: 0.6,
      builder: (context, scrollController) {
        return Container(
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            color: kWhiteColor,
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      height: 4,
                      width: 30,
                      decoration: BoxDecoration(
                        color: kLightblack,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  kHeight(kGetHeight * 0.02),
                  MainTitle(studentModel: studentModel),
                  kHeight(kGetHeight * 0.03),
                    kDivider,
                  kHeight(kGetHeight * 0.02),
                  InfoWidget(
                    heading: 'Personal information',
                    heading2: 'Other details',
                    studentModel: studentModel,
                  ),
                  kHeight(kGetHeight * 0.05),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
