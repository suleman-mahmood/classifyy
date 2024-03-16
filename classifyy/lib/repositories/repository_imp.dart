import 'package:classifyy/locator.dart';
import 'package:classifyy/models/announcement/announcement.dart';
import 'package:classifyy/models/chat/chat_message.dart';
import 'package:classifyy/models/user/teacher_class.dart';
import 'package:classifyy/models/user/class_student.dart';
import 'package:classifyy/models/user/parent_child.dart';
import 'package:classifyy/models/user/student_teacher.dart';
import 'package:classifyy/models/user/user.dart';
import 'package:classifyy/repositories/repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ImpRepository implements Repository {
  @override
  String? userId;

  ImpRepository({this.userId});

  @override
  Future<String> loginUser(String email, String password) async {
    final AuthResponse res = await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
    userId = res.user!.id;

    return res.user!.id;
  }

  @override
  Future<List<TeacherClass>> fetchClasses() async {
    final data = await supabase
        .from('classes')
        .select('*, users(id)')
        .eq('users.id', userId!);
    return TeacherClass.fromMapList(data);
  }
  
  @override
  Future<UserModel> getUser(String id) async {
    final data = await supabase.from('users').select().eq('id', id).single();
    return UserModel.fromMap(data);
  }

  @override
  Future<List<ParentChild>> fetchChildren() async {
    final data = await supabase
        .from('users')
        .select()
        .eq('parent_id', userId!);
    return ParentChild.fromMapList(data);
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
