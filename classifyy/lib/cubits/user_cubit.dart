import 'package:bloc/bloc.dart';
import 'package:classifyy/models/user/teacher_class.dart';
import 'package:classifyy/models/user/parent_child.dart';
import 'package:classifyy/models/user/user.dart';
import 'package:classifyy/repositories/repository.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final Repository repository;

  UserCubit(this.repository) : super(const UserInitial());

  Future<void> fetchUser(String id) async {
    emit(const UserLoading());

    try {
      final user = await repository.getUser(id);
      emit(UserSuccess(user: user));
    } on PostgrestException catch (e) {
      emit(UserFailure(errorMessage: e.message));
    }
  }

  Future<void> loginUser(String email, String password) async {
    emit(const UserLoading());

    try {
      final id = await repository.loginUser(email, password);
      fetchUser(id);
    } on AuthException catch (e) {
      emit(UserFailure(errorMessage: e.message));
    }
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

  Future<void> logoutUser() async {
    // TODO: Complete Impl
    // supabase.auth.signOut
    emit(UserLogoutSuccess());
  }
}
