import 'package:bloc/bloc.dart';
import 'package:classifyy/models/user/student_teacher.dart';
import 'package:classifyy/repositories/repository.dart';
import 'package:meta/meta.dart';

part 'student_teacher_state.dart';

class StudentTeacherCubit extends Cubit<StudentTeacherState> {
  final Repository repository;

  StudentTeacherCubit(this.repository) : super(const StudentTeacherInitial());

  Future<void> fetchStudentTeachers(String studentId) async {
    emit(const StudentTeacherLoading());

    final studentTeachers = await repository.fetchStudentTeachers(studentId);

    emit(StudentTeacherSuccess(studentTeachers: studentTeachers));
  }
}
