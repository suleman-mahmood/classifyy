import 'dart:math';

import 'package:classifyy/cubits/storage_cubit.dart';
import 'package:classifyy/presentation/config/utils.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mime/mime.dart';

class FileUploadWidget extends StatefulWidget {
  const FileUploadWidget({super.key});

  @override
  State<FileUploadWidget> createState() => _FileUploadWidgetState();
}

class _FileUploadWidgetState extends State<FileUploadWidget> {
  late final StorageCubit storageCubit;

  String? fileName;
  bool showAdditionalClasses = false;

  @override
  void initState() {
    super.initState();

    storageCubit = BlocProvider.of<StorageCubit>(context);
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'pdf', 'png'],
    );

    if (result != null && result.files.isNotEmpty) {
      final file = result.files.first;
      storageCubit.uploadFile(
        file.path!,
        file.name,
        lookupMimeType(file.path!)!,
      );
      setState(() => fileName = file.name);
    }
  }

  Future<void> _downloadFile() async {
    await storageCubit.downloadFile(
      "Test.pdf",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ElevatedButton(
        //   onPressed: _pickFile,
        //   child: const Text('Choose File'),
        // ),
        // ElevatedButton(
        //   onPressed: _downloadFile,
        //   child: const Text('Download File'),
        // ),
        // Image.network(
        //   "http://localhost:80/api/storage/download?file_id=341bceef-16f6-405c-91ed-4ccdd24d0e3c.jpeg",
        // ),
        Card(
          color: const Color(0xFFFEF7FF),
          child: Column(
            children: [
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.file_upload_outlined),
                    Text('Upload File'),
                  ],
                ),
                subtitle: Text(
                  "Max file size 5120KB. JPG, JPEG, PNG, PDF only\n3 files max",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12),
                ),
                trailing: showAdditionalClasses
                    ? Transform.rotate(
                        angle: pi / 2,
                        child: Icon(Icons.arrow_back_ios_outlined, size: ScreenSizes.slabTwo))
                    : Transform.rotate(
                        angle: -pi / 2,
                        child: Icon(Icons.arrow_back_ios_outlined, size: ScreenSizes.slabTwo)),
                onTap: () {
                  setState(() {
                    showAdditionalClasses = !showAdditionalClasses;
                  });
                },
              ),
              Visibility(
                visible: showAdditionalClasses,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    ListTile(
                      title: Text('file name'),
                      subtitle: Text('file size'),
                      trailing: Icon(Icons.delete_outline_outlined),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_circle_outline_outlined),
                          SizedBox(width: ScreenSizes.slabOne),
                          Text('Add another'),
                        ],
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
