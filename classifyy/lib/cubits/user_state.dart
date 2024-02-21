part of 'user_cubit.dart';

@immutable
sealed class UserState {
  final User? user;
  final Student? selectedChild;
  final Class? selectedClass;

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

final class UserFailure extends UserState {
  const UserFailure({super.errorMessage});
}
