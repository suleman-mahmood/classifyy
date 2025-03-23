import 'package:classifyy/models/announcement/announcement.dart';
import 'package:classifyy/models/chat/chat_message.dart';
import 'package:classifyy/models/user/teacher_class.dart';
import 'package:classifyy/models/user/class_student.dart';
import 'package:classifyy/models/user/parent_child.dart';
import 'package:classifyy/models/user/student_teacher.dart';
import 'package:classifyy/models/user/user.dart';
import 'package:classifyy/repositories/repository.dart';
import 'package:dio/dio.dart';

class ApiImpRepository implements Repository {
  @override
  late String userId;

  final Dio _dio;

  ApiImpRepository({Dio? dio})
      : _dio = dio ??
            Dio(BaseOptions(
              baseUrl: "http://localhost:80/api",
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
    throw UnimplementedError();
  }

  @override
  Future<List<ParentChild>> fetchChildren() async {
    throw UnimplementedError();
  }

  @override
  Future<List<ClassStudent>> fetchClassStudents(String classId) async {
    throw UnimplementedError();
  }

  @override
  Future<List<StudentTeacher>> fetchStudentTeachers(String childId) async {
    throw UnimplementedError();
  }

  // Announcements

  @override
  Future<List<Announcement>> fetchAnnouncements(
    int startIndex,
    int endIndex, {
    String? studentId,
    String? classId,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<void> createAnnouncement(String text, String? classId) async {
    throw UnimplementedError();
  }

  // Chat

  @override
  Future<List<ChatMessage>> fetchChatMessages() async {
    throw UnimplementedError();
  }

  @override
  Future<List<ClassStudent>> fetchUnreadChats() async {
    throw UnimplementedError();
  }

  @override
  Future<void> sendMessage(String message, String otherUserId) async {
    throw UnimplementedError();
  }

  @override
  Future<void> markChatRead(String chatId) async {
    throw UnimplementedError();
  }
}
