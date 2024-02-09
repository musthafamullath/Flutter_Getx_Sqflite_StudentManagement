import 'package:flutter/material.dart';
import 'package:student_management_squflite_getx/core/colors.dart';
import 'package:student_management_squflite_getx/core/constants.dart';
import 'package:student_management_squflite_getx/data/model/student.dart';

class MainTitle extends StatelessWidget {
  const MainTitle({super.key, required this.studentModel});
  final StudentModel studentModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              studentModel.name!,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            Text(
              "Department: ${studentModel.department}",
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        const Spacer(),
        Container(
          width: kGetWidth * 0.15,
          height: kGetHeight * 0.07,
          decoration: BoxDecoration(
            color: kDarkBlue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               const Text(
                'Class',
                style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 12,
                  height: 1.2,
                ),
              ),
              Text(
                studentModel.studentClass!,
                style: const TextStyle(
                  height: 1.2,
                  fontSize: 22,
                  color: kWhiteColor,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
