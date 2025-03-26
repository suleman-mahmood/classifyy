import 'package:bloc/bloc.dart';
import 'package:classifyy/models/user/parent_child.dart';
import 'package:classifyy/repositories/repository.dart';

part 'children_state.dart';

class ChildrenCubit extends Cubit<ChildrenState> {
  final Repository repository;

  ChildrenCubit(this.repository) : super(const ChildrenInitial());

  Future<void> fetchChildren() async {
    emit(const ChildrenLoading());

    final children = await repository.fetchChildren();

    emit(ChildrenSuccess(children: children));
  }

  void reset() {
    emit(ChildrenInitial());
  }
}
