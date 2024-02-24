part of 'student_teacher_cubit.dart';

@immutable
sealed class StudentTeacherState {
  final List<StudentTeacher> studentTeachers;

  final String errorMessage;

  const StudentTeacherState({
    this.errorMessage = '',
    this.studentTeachers = const [],
  });
}

final class StudentTeacherInitial extends StudentTeacherState {
  const StudentTeacherInitial();
}

final class StudentTeacherLoading extends StudentTeacherState {
  const StudentTeacherLoading();
}

final class StudentTeacherSuccess extends StudentTeacherState {
  const StudentTeacherSuccess({super.studentTeachers});
}

final class StudentTeacherFailure extends StudentTeacherState {
  const StudentTeacherFailure({super.errorMessage});
}