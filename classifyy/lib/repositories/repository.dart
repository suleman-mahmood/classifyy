import 'package:classifyy/models/announcement/announcement.dart';
import 'package:classifyy/models/chat/chat_message.dart';
import 'package:classifyy/models/user/teacher_class.dart';
import 'package:classifyy/models/user/class_student.dart';
import 'package:classifyy/models/user/parent_child.dart';
import 'package:classifyy/models/user/student_teacher.dart';
import 'package:classifyy/models/user/user.dart';

abstract class Repository {
  String? userId;

  Repository({this.userId});

  Future<String> loginUser(String email, String password);

  Future<UserModel> getUser(String id);

  Future<List<TeacherClass>> fetchClasses();

  Future<List<ParentChild>> fetchChildren();

  Future<List<ClassStudent>> fetchClassStudents(String classId);

  Future<List<StudentTeacher>> fetchStudentTeachers();

  // Announcements

  Future<List<Announcement>> fetchAnnouncements(int startIndex, int endIndex);

  Future<void> createAnnouncement(String text);

  // Chat

  Future<List<ChatMessage>> fetchChatMessages();

  Future<List<ClassStudent>> fetchUnreadChats();

  Future<void> sendMessage(String message);

  Future<void> markChatRead(String chatId);
}
