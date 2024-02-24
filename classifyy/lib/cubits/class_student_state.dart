part of 'class_student_cubit.dart';

@immutable
sealed class ClassStudentState {
  final List<ClassStudent> classStudents;

  final String errorMessage;

  const ClassStudentState({
    this.errorMessage = '',
    this.classStudents = const [],
  });
}

final class ClassStudentInitial extends ClassStudentState {
  const ClassStudentInitial();
}

final class ClassStudentLoading extends ClassStudentState {
  const ClassStudentLoading();
}

final class ClassStudentSuccess extends ClassStudentState {
  const ClassStudentSuccess({super.classStudents});
}

final class ClassStudentFailure extends ClassStudentState {
  const ClassStudentFailure({super.errorMessage});
}
