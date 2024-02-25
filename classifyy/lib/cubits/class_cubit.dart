import 'package:bloc/bloc.dart';
import 'package:classifyy/models/user/teacher_class.dart';
import 'package:classifyy/repositories/repository.dart';
import 'package:meta/meta.dart';

part 'class_state.dart';

class ClassCubit extends Cubit<ClassState> {
  final Repository repository;

  ClassCubit(this.repository) : super(const ClassInitial());

  Future<void> fetchClasses() async {
    emit(const ClassLoading());

    final classes = await repository.fetchClasses();

    emit(ClassSuccess(classes: classes));
  }
}
