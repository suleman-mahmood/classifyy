import 'package:bloc/bloc.dart';
import 'package:classifyy/repositories/repository.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final Repository repository;

  UserCubit(this.repository) : super(const UserInitial());

  Future<void> loginUser(String email, String password) async {
    emit(const UserLoading());

    await repository.loginUser(email, password);

    emit(const UserSuccess());
  }
}
