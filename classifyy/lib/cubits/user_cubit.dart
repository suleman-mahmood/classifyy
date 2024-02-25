import 'package:bloc/bloc.dart';
import 'package:classifyy/models/user/teacher_class.dart';
import 'package:classifyy/models/user/parent_child.dart';
import 'package:classifyy/models/user/user.dart';
import 'package:classifyy/repositories/repository.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final Repository repository;

  UserCubit(this.repository) : super(const UserInitial());

  Future<void> loginUser(String email, String password) async {
    emit(const UserLoading());

    await repository.loginUser(email, password);

    final user = await repository.getUser();

    emit(UserSuccess(user: user));
  }

  Future<void> selectChild(ParentChild student) async {
    emit(UserSuccess(
      user: state.user,
      selectedChild: student,
      selectedClass: state.selectedClass,
    ));
  }

  Future<void> selectClass(TeacherClass selectedClass) async {
    emit(UserSuccess(
      user: state.user,
      selectedChild: state.selectedChild,
      selectedClass: selectedClass,
    ));
  }
}
