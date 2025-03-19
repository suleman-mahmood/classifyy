part of 'user_cubit.dart';

@immutable
sealed class UserState {
  final UserModel? user;
  final ParentChild? selectedChild;
  final TeacherClass? selectedClass;

  final String errorMessage;

  const UserState({
    this.errorMessage = '',
    this.user,
    this.selectedChild,
    this.selectedClass,
  });
}

final class UserInitial extends UserState {
  const UserInitial();
}

final class UserLoading extends UserState {
  const UserLoading();
}

final class UserSuccess extends UserState {
  const UserSuccess({super.user, super.selectedChild, super.selectedClass});
}

final class UserLogoutSuccess extends UserState {
  const UserLogoutSuccess();
}

final class UserFailure extends UserState {
  const UserFailure({super.errorMessage});
}
