import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_management_squflite_getx/core/assets.dart';
import 'package:student_management_squflite_getx/core/colors.dart';
import 'package:student_management_squflite_getx/presentation/screens/add%20student/widgets/sub_heading.dart';
import 'package:student_management_squflite_getx/presentation/widgets/custom_text_field_widget.dart';
import 'package:student_management_squflite_getx/presentation/widgets/heading.dart';

import '../../../../core/constants.dart';

Row headAndImageSection({
  required String text,
  required void Function()? onTap,
  required ImageProvider<Object> image,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              width: 18,
              child: Image.asset(
                leftArrowIcon,
                color: kAqua,
              ),
            ),
          ),
          kHeight(kGetHeight * 0.05),
          HeadingWidget(
            text: text,
            textColor: kAqua,
          ),
        ],
      ),
      const Spacer(),
      Column(
        children: [
          InkWell(
            onTap: onTap,
            child: Container(
              width: kGetWidth * 0.38,
              height: kGetHeight * 0.18,
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(40),
                image: DecorationImage(image: image, fit: BoxFit.cover),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 10,
                    offset: Offset(0, 6),
                    spreadRadius: 0,
                    color: Color(0x1A000000),
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8),
            child: Text('Choose Profile',style: TextStyle(color: kAqua),),
          ),
        ],
      ),
    ],
  );
}

Column personalInfoSection({
  required TextEditingController nameController,
  required TextEditingController dobController,
  required TextEditingController genderController,
  required TextEditingController phoneNumberController,
  required TextEditingController emailController,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SubHeadingWidget(
        text: 'Personal Details',
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: kAqua,
      ),
      CustomTextFieldWidget(
        labelText: 'Full Name',
        controller: nameController,
        textInputType: TextInputType.text,
      ),
      CustomTextFieldWidget(
        labelText: 'Date of Birth',
        controller: dobController,
        textInputType: TextInputType.datetime,
      ),
      CustomTextFieldWidget(
        labelText: 'Gender',
        controller: genderController,
        textInputType: TextInputType.text,
      ),
      CustomTextFieldWidget(
        labelText: 'Phone Number',
        controller: phoneNumberController,
        textInputType: TextInputType.phone,
      ),
      CustomTextFieldWidget(
        labelText: 'Email Address',
        controller: emailController,
        textInputType: TextInputType.emailAddress,
      ),
    ],
  );
}

Column otherDetailSection({
  required TextEditingController departmentController,
  required TextEditingController rollNumberController,
  required TextEditingController studentClassController,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SubHeadingWidget(
        text: 'Other Details:',
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: kAqua,
      ),
      CustomTextFieldWidget(
        textInputType: TextInputType.text,
        controller: departmentController,
        labelText: 'Department',
      ),
      CustomTextFieldWidget(
        textInputType: TextInputType.number,
        controller: rollNumberController,
        labelText: 'Roll no.',
      ),
      CustomTextFieldWidget(
        textInputType: TextInputType.number,
        controller: studentClassController,
        labelText: 'Class',
      ),
    ],
  );
}
