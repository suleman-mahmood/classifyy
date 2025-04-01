part of 'storage_cubit.dart';

@immutable
sealed class StorageState {
  final String fileId;
  final String errorMessage;

  const StorageState({
    this.fileId = '',
    this.errorMessage = '',
  });
}

final class StorageInitial extends StorageState {
  const StorageInitial();
}

final class StorageLoading extends StorageState {
  const StorageLoading();
}

final class StorgeSuccess extends StorageState {
  const StorgeSuccess({super.fileId});
}

final class StorageFailure extends StorageState {
  const StorageFailure({super.errorMessage});
}
