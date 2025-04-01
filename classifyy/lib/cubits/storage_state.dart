part of 'storage_cubit.dart';

@immutable
sealed class StorageState {
  final String file;
  final String fileId;
  final String errorMessage;

  const StorageState({
    this.fileId = '',
    this.errorMessage = '',
    this.file = '',
  });
}

final class StorageInitial extends StorageState {
  const StorageInitial();
}

final class StorageLoading extends StorageState {
  const StorageLoading();
}

final class StorgeUploadSuccess extends StorageState {
  const StorgeUploadSuccess({super.fileId});
}

final class StorgeDownloadSuccess extends StorageState {
  const StorgeDownloadSuccess({super.file});
}

final class StorageFailure extends StorageState {
  const StorageFailure({super.errorMessage});
}
