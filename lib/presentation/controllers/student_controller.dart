import 'package:get/get.dart';
import 'package:student_management_squflite_getx/data/model/student.dart';
import 'package:student_management_squflite_getx/data/repository/student_repository.dart';

class StudentController extends GetxController{
  RxList<StudentModel> allStudent = <StudentModel>[].obs;
  StudentRepository studentRepository = StudentRepository();
  @override
  void onInit() {
    fetchAllStudent();
    super.onInit();
  }
  fetchAllStudent({String? query})async{
    var student = await studentRepository.getData(query ?? '');
    allStudent.value = student;
  }
  addStudent(StudentModel studentModel){
    studentRepository.addData(studentModel);
    fetchAllStudent();
  }
  updateStudent(StudentModel studentModel){
    studentRepository.updateData(studentModel);
    fetchAllStudent();
  }
  deleteStudent(int id){
    studentRepository.deleteData(id);
    fetchAllStudent();
  }
}