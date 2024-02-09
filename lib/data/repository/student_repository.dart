

import 'package:student_management_squflite_getx/data/database/db_helper.dart';
import 'package:student_management_squflite_getx/data/database/utils.dart';
import 'package:student_management_squflite_getx/data/model/student.dart';

class StudentRepository {
  DBHelper dbHelper = DBHelper();

  Future<List<StudentModel>> getData(String query) async {
    var dbClient = await dbHelper.db;
    List<Map> maps = await dbClient.query(tableName, columns: [
      'id',
      'name',
      'dob',
      'gender',
      'phoneNumber',
      'emailAddress',
      'homeAddress',
      'profile',
      'department',
      'admissionDate',
      'studentId',
      'rollNumber',
      'studentClass'
    ]);
    List<StudentModel> student = [];

    for (int i = 0; i < maps.length; i++) {
      student.add(StudentModel.fromMap(maps[i]));
    }
    return 
    query == ''
        ? student
        : student
            .where((element) =>
                element.name!.toLowerCase().contains(query.toLowerCase()))
            .toList();
  }

  Future<int> addData(StudentModel studentModel) async {
    var dbClient = await dbHelper.db;
    return await dbClient.insert(tableName, studentModel.toMap());
  }

  Future<int> updateData(StudentModel studentModel) async {
    var dbClient = await dbHelper.db;
    return await dbClient.update(tableName, studentModel.toMap(),
        where: 'id = ?', whereArgs: [studentModel.id]);
  }

  Future<int> deleteData(int id) async {
    var dbClient = await dbHelper.db;
    return await dbClient.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }
}