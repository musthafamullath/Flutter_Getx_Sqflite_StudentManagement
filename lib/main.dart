import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_management_squflite_getx/core/themes/dark_theme.dart';
import 'package:student_management_squflite_getx/core/themes/light_theme.dart';
import 'package:student_management_squflite_getx/presentation/screens/add%20student/screen_add_student.dart';
import 'package:student_management_squflite_getx/presentation/screens/main%20screen/main_screen.dart';
import 'package:student_management_squflite_getx/presentation/screens/student%20detail/screen_student_details.dart';
import 'package:student_management_squflite_getx/presentation/screens/student%20list/screen_student_list.dart';
import 'package:student_management_squflite_getx/presentation/screens/update%20student/screen_student_update.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Student Mangement",
      debugShowCheckedModeBanner: false,
      theme: lighTheme,
      darkTheme: darkTheme,
      home: const MainScreen(),
      getPages: [
        GetPage(
          name: '/screen_student_add',
          page: () => ScreenAddStudent(),
          transition: Transition.fade,
        ),
        GetPage(
          name: '/screen_student_update',
          page: () => ScreenUpdateStudent(),
          transition: Transition.fade,
        ),
        GetPage(
          name: '/screen_student_list',
          page: () => ScreenStudentList(),
          transition: Transition.fade,
        ),
        GetPage(
          name: '/screen_student_detail',
          page: () => ScreenStudentDetail(),
          transition: Transition.fade,
        ),
      ],
    );
  }
}
