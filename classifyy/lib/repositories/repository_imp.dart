import 'package:classifyy/models/announcement/announcement.dart';
import 'package:classifyy/models/chat/chat_message.dart';
import 'package:classifyy/models/user/teacher_class.dart';
import 'package:classifyy/models/user/class_student.dart';
import 'package:classifyy/models/user/parent_child.dart';
import 'package:classifyy/models/user/student_teacher.dart';
import 'package:classifyy/models/user/user.dart';
import 'package:classifyy/repositories/repository.dart';

class ImpRepository implements Repository {
  @override
  String? authToken;

  ImpRepository({this.authToken});

  @override
  Future<String> loginUser(String email, String password) {
    // TODO: implement loginUser
    throw UnimplementedError();
  }

  @override
  Future<List<TeacherClass>> fetchClasses() {
    // TODO: implement fetchClasses
    throw UnimplementedError();
  }
  
  @override
  Future<User> getUser(String id) {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<List<ParentChild>> fetchChildren() {
    // TODO: implement fetchChildren
    throw UnimplementedError();
  }

  @override
  Future<List<Announcement>> fetchAnnouncements(int startIndex, int endIndex) {
    // TODO: implement fetchAnnouncements
    throw UnimplementedError();
  }
  
  @override
  Future<void> createAnnouncement(String text) {
    // TODO: implement createAnnouncement
    throw UnimplementedError();
  }

  @override
  Future<List<ClassStudent>> fetchClassStudents() {
    // TODO: implement fetchClassStudents
    throw UnimplementedError();
  }

  @override
  Future<List<ChatMessage>> fetchChatMessages() {
    // TODO: implement fetchChatMessages
    throw UnimplementedError();
  }

  @override
  Future<List<StudentTeacher>> fetchStudentTeachers() {
    // TODO: implement fetchStudentTeachers
    throw UnimplementedError();
  }
  
  @override
  Future<void> sendMessage(String message) {
    // TODO: implement sendMessage
    throw UnimplementedError();
  }
  
  @override
  Future<List<ClassStudent>> fetchUnreadChats() {
    // TODO: implement fetchUnreadChats
    throw UnimplementedError();
  }
  
  @override
  Future<void> markChatRead(String chatId) {
    // TODO: implement markChatRead
    throw UnimplementedError();
  }
}
