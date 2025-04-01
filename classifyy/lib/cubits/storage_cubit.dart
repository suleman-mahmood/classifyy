import 'package:bloc/bloc.dart';
import 'package:classifyy/repositories/repository.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'storage_state.dart';

class StorageCubit extends Cubit<StorageState> {
  final Repository repository;

  StorageCubit(this.repository) : super(const StorageInitial());

  Future<void> uploadFile(String filePath, String fileName) async {
    emit(const StorageLoading());

    try {
      final fileId = await repository.uploadFile(filePath, fileName);
      emit(StorgeSuccess(fileId: fileId));
    } on PostgrestException catch (e) {
      emit(StorageFailure(errorMessage: e.message));
    }
  }
}
