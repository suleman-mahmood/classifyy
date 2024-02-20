part of 'children_cubit.dart';

sealed class ChildrenState {
  final String errorMessage;
  final List<Student> children;

  const ChildrenState({
    this.errorMessage = '',
    this.children = const [],
  });
}

final class ChildrenInitial extends ChildrenState {
  const ChildrenInitial();
}

final class ChildrenLoading extends ChildrenState {
  const ChildrenLoading();
}

final class ChildrenSuccess extends ChildrenState {
  const ChildrenSuccess({super.children});
}

final class ChildrenFailure extends ChildrenState {
  const ChildrenFailure({super.errorMessage});
}