import 'package:bloc/bloc.dart';
import 'package:classifyy/models/user/class_student.dart';
import 'package:classifyy/repositories/repository.dart';
import 'package:meta/meta.dart';

part 'class_student_state.dart';

class ClassStudentCubit extends Cubit<ClassStudentState> {
  final Repository repository;

  ClassStudentCubit(this.repository) : super(const ClassStudentInitial());

  Future<void> fetchClassStudents() async {
    emit(const ClassStudentLoading());

    final classStudents = await repository.fetchClassStudents();

    emit(ClassStudentSuccess(classStudents: classStudents));
  }
}
