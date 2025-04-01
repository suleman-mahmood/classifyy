import 'package:classifyy/cubits/storage_cubit.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FileUploadWidget extends StatefulWidget {
  const FileUploadWidget({super.key});

  @override
  State<FileUploadWidget> createState() => _FileUploadWidgetState();
}

class _FileUploadWidgetState extends State<FileUploadWidget> {
  late final StorageCubit storageCubit;

  String? _fileName;

  @override
  void initState() {
    super.initState();

    storageCubit = BlocProvider.of<StorageCubit>(context);
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.isNotEmpty) {
      final file = result.files.first;
      storageCubit.uploadFile(file.path!, file.name);
      setState(() => _fileName = file.name);
    }
  }

  Future<void> _downloadFile() async {
    await storageCubit.downloadFile(
      "341bceef-16f6-405c-91ed-4ccdd24d0e3c.jpeg",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: _pickFile,
          child: const Text('Choose File'),
        ),
        ElevatedButton(
          onPressed: _downloadFile,
          child: const Text('Download File'),
        ),
        Image.network(
          "http://localhost:80/api/storage/download?file_id=341bceef-16f6-405c-91ed-4ccdd24d0e3c.jpeg",
        ),
        const SizedBox(height: 10),
        if (_fileName != null)
          Text(
            'Selected File: $_fileName',
            style: const TextStyle(fontSize: 16),
          ),
      ],
    );
  }
}
