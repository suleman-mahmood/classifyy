part of 'class_cubit.dart';

@immutable
sealed class ClassState {
  final String errorMessage;
  final List<Class> classes;

  const ClassState({
    this.errorMessage = '',
    this.classes = const [],
  });
}

final class ClassInitial extends ClassState {
  const ClassInitial();
}

final class ClassLoading extends ClassState {
  const ClassLoading();
}

final class ClassSuccess extends ClassState {
  const ClassSuccess({super.classes});
}

final class ClassFailure extends ClassState {
  const ClassFailure({super.errorMessage});
}
