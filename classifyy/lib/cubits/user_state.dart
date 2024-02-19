part of 'user_cubit.dart';

@immutable
sealed class UserState {
  final String errorMessage;

  const UserState({
    this.errorMessage = '',
  });
}

final class UserInitial extends UserState {
  const UserInitial();
}

final class UserLoading extends UserState {
  const UserLoading();
}

final class UserSuccess extends UserState {
  const UserSuccess();
}

final class UserFailure extends UserState {
  const UserFailure({super.errorMessage});
}
