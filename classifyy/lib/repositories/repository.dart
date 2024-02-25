import 'package:classifyy/models/announcement/announcement.dart';
import 'package:classifyy/models/chat/chat_message.dart';
import 'package:classifyy/models/user/teacher_class.dart';
import 'package:classifyy/models/user/class_student.dart';
import 'package:classifyy/models/user/parent_child.dart';
import 'package:classifyy/models/user/student_teacher.dart';
import 'package:classifyy/models/user/user.dart';

abstract class Repository {
  String? authToken;

  Repository({this.authToken});

  Future<void> loginUser(String email, String password);

  Future<List<TeacherClass>> fetchClasses();

  Future<List<ParentChild>> fetchChildren();

  Future<String> getAuthToken();

  Future<User> getUser();

  Future<List<Announcement>> fetchAnnouncements(int startIndex, int endIndex);

  Future<void> createAnnouncement(String text);

  Future<List<ClassStudent>> fetchClassStudents();

  Future<List<StudentTeacher>> fetchStudentTeachers();

  Future<List<ChatMessage>> fetchChatMessages();
}
