import 'package:classifyy/models/announcement/announcement.dart';
import 'package:classifyy/models/chat/chat_message.dart';
import 'package:classifyy/models/user/teacher_class.dart';
import 'package:classifyy/models/user/class_student.dart';
import 'package:classifyy/models/user/parent_child.dart';
import 'package:classifyy/models/user/student_teacher.dart';
import 'package:classifyy/models/user/user.dart';
import 'package:classifyy/repositories/repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiImpRepository implements Repository {
  @override
  late String userId;

  final Dio _dio;

  ApiImpRepository({Dio? dio})
      : _dio = dio ??
            Dio(BaseOptions(
              baseUrl: kDebugMode
                  ? "http://localhost:80/api"
                  : "https://admin.suleman.dev/api",
              connectTimeout: Duration(seconds: 5),
              receiveTimeout: Duration(seconds: 3),
            ));

  @override
  Future<String> loginUser(String email, String password) async {
    final res = await _dio.post(
      '/auth/login',
      data: {'email': email, 'password': password},
    );

    userId = res.data['user_id'];
    return userId;
  }

  @override
  Future<UserModel> getUser(String id) async {
    final res = await _dio.get(
      '/user',
      queryParameters: {"user_id": userId},
    );
    return UserModel.fromMap(res.data);
  }

  @override
  Future<List<TeacherClass>> fetchClasses() async {
    final res = await _dio.get(
      '/class/teacher',
      queryParameters: {"user_id": userId},
    );
    return TeacherClass.fromMapList(res.data);
  }

  @override
  Future<List<ParentChild>> fetchChildren() async {
    final res = await _dio.get(
      '/user/children',
      queryParameters: {"parent_user_id": userId},
    );
    return ParentChild.fromMapList(res.data);
  }

  @override
  Future<List<ClassStudent>> fetchClassStudents(String classId) async {
    final res = await _dio.get(
      '/class/students',
      queryParameters: {'class_id': classId},
    );
    return ClassStudent.fromMapList(res.data);
  }

  @override
  Future<List<StudentTeacher>> fetchStudentTeachers(String childId) async {
    final res = await _dio.get(
      '/user/teachers',
      queryParameters: {'student_user_id': childId},
    );
    return StudentTeacher.fromMapList(res.data);
  }

  // Announcements

  @override
  Future<List<Announcement>> fetchAnnouncements(String userId) async {
    final res = await _dio.get(
      '/announcement/user',
      queryParameters: {"user_id": userId},
    );
    return Announcement.fromMapList(res.data);
  }

  @override
  Future<void> createAnnouncement(String text, String? classId) async {
    await _dio.post(
      '/announcement',
      data: {"announcement": text, "announcer_id": userId, "class_id": classId},
    );
  }

  // Chat

  @override
  Future<List<ChatMessage>> fetchChatMessages(String otherUserId) async {
    final res = await _dio.get('/chat', queryParameters: {
      "sender_user_id": userId,
      "recipient_user_id": otherUserId
    });

    return ChatMessage.fromMapList(res.data, userId);
  }

  @override
  Future<List<ClassStudent>> fetchUnreadChats() async {
    throw UnimplementedError();
  }

  @override
  Future<void> sendMessage(String message, String otherUserId) async {
    await _dio.post('/chat', data: {
      "sender_user_id": userId,
      "recipient_user_id": otherUserId,
      "message": message
    });
  }

  @override
  Future<void> markChatRead(String chatId) async {
    throw UnimplementedError();
  }

  @override
  Future<String> uploadFile(String filePath, String fileName) async {
    final file = await MultipartFile.fromFile(filePath, filename: fileName);
    final metadata = MultipartFile.fromString(
      '{"name": $fileName}',
      contentType: DioMediaType('application', 'json'),
    );
    final formData = FormData.fromMap({'file': file, "json": metadata});
    final res = await _dio.post(
      "/storage/upload",
      data: formData,
      options: Options(
        contentType: 'multipart/form-data',
      ),
    );
    return res.data["file_id"];
  }
}
