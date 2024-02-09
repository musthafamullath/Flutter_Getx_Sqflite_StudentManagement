import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_management_squflite_getx/core/assets.dart';
import 'package:student_management_squflite_getx/core/colors.dart';
import 'package:student_management_squflite_getx/core/constants.dart';


class MainScreen extends StatelessWidget {
   const MainScreen({
    super.key,
  });
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                top: 30,
                right: 30,
                child: GestureDetector(
                  onTap: () {
                    Get.changeThemeMode(
                        Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
                  },
                  child: const  CircleAvatar(
                    backgroundColor: kDarkBlue,
                    child:
                    Icon(
                      Icons.dark_mode_rounded,
                      color: kAmber,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 100,
                left: 20,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    kHeight(kGetHeight * 0.2 / 10),
                    Text(
                      "WELCOME TO \nSTUDENT MANAGEMENT APP",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).hintColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              kHeight(kGetHeight * 0.03),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Text(
                        "Manage Your Students \nDetails",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).hintColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Image.asset(
                      managementIcon,
                      width: kGetWidth * 0.6,
                      color: Theme.of(context).dividerColor,
                    ),
                    kHeight(kGetHeight * 0.03),
                    _mainPageBtn(
                      btnText: 'Add New Student',
                      onPressed: () => Get.toNamed('/screen_student_add'),
                      context: context,
                    ),
                    kHeight(kGetHeight * 0.03),
                    _mainPageBtn(
                      btnText: 'View All Students',
                      onPressed: () => Get.toNamed('/screen_student_list'),
                      context: context,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  MaterialButton _mainPageBtn(
      {required String btnText,
      required void Function()? onPressed,
      required BuildContext context}) {
    return MaterialButton(
      padding: const EdgeInsets.fromLTRB(100, 15, 100, 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Theme.of(context).dividerColor.withOpacity(0.7),
      textColor: Theme.of(context).colorScheme.inversePrimary,
      onPressed: onPressed,
      child: Text(
        btnText,
        style: const TextStyle(fontSize: 15),
      ),
    );
  }
}
