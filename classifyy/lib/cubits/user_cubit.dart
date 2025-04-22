import 'package:bloc/bloc.dart';
import 'package:classifyy/models/user/teacher_class.dart';
import 'package:classifyy/models/user/parent_child.dart';
import 'package:classifyy/models/user/user.dart';
import 'package:classifyy/repositories/repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:local_auth/local_auth.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  Future<void> loginUserWithBiometrics() async {
    try {
      final LocalAuthentication auth = LocalAuthentication();
      final didAuthenticate = await auth.authenticate(
        localizedReason: "Authenticate to login",
      );
      if (didAuthenticate) {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        final email = prefs.getString("email");
        final password = prefs.getString("password");
        if (email != null && password != null) {
          await loginUser(
            email,
            password,
          );
        } else {
          debugPrint("No email $email or password $password stored for user");
        }
      }
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
    }
  }

  Future<void> loginUser(String email, String password) async {
    emit(const UserLoading());

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("email", email);
    await prefs.setString("password", password);

    try {
      final id = await repository.loginUser(email, password);
      fetchUser(id);
    } on DioException catch (e) {
      print(e.response);
      emit(UserFailure(errorMessage: "Wrong email or password"));
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
