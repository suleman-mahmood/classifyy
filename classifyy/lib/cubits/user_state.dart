part of 'user_cubit.dart';

@immutable
sealed class UserState {
  final String errorMessage;
  final User? user;

  const UserState({
    this.errorMessage = '',
    this.user,
  });
}

final class UserInitial extends UserState {
  const UserInitial();
}

final class UserLoading extends UserState {
  const UserLoading();
}

final class UserSuccess extends UserState {
  const UserSuccess({super.user});
}

final class UserFailure extends UserState {
  const UserFailure({super.errorMessage});
}
