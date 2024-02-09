import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_management_squflite_getx/core/assets.dart';
import 'package:student_management_squflite_getx/core/colors.dart';
import 'package:student_management_squflite_getx/core/constants.dart';
import 'package:student_management_squflite_getx/presentation/widgets/custom_search_field.dart';
import 'package:student_management_squflite_getx/presentation/widgets/heading.dart';

class CustomAppBarWidget extends StatelessWidget {
  const CustomAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kDarkBlue,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          10,
          0,
          10,
          0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () => Get.back(),
                  child: Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    width: 18,
                    child: Image.asset(
                      leftArrowIcon,
                      color: kWhiteColor,
                    ),
                  ),
                ),
                kWidth(kGetWidth * 0.05),
                const HeadingWidget(
                  text: "List Of Students",
                  textColor: kWhiteColor,
                ),
              ],
            ),
            kHeight(kGetHeight * 0.03),
            CustomSearchFieldWidget(),
          ],
        ),
      ),
    );
  }
}
