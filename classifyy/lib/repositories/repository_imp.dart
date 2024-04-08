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
import 'package:uuid/v4.dart';

class ImpRepository implements Repository {
  @override
  String? userId;

  ImpRepository({this.userId});

  @override
  Future<void> loginUser(String email, String password) async {
    final AuthResponse res = await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
    userId = res.user!.id;
  }

  @override
  Future<List<TeacherClass>> fetchClasses() async {
    userId ??= (await supabase.auth.getUser()).user!.id;

    final data = await supabase
        .from('classes')
        .select('*, users!inner(id)')
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
    userId ??= (await supabase.auth.getUser()).user!.id;

    final data = await supabase.from('users').select().eq('parent_id', userId!);
    return ParentChild.fromMapList(data);
  }

  @override
  Future<List<Announcement>> fetchAnnouncements(
      int startIndex, int endIndex) async {
    final data = await supabase
        .from('announcements')
        .select('*, users!inner(id, display_name, user_role)')
        .order('created_at', ascending: false)
        .limit(100); // TODO: Pagination
    return Announcement.fromMapList(data);
  }

  @override
  Future<void> createAnnouncement(String text) async {
    final data = {
      'id': const UuidV4().generate(),
      'announcer_id': userId!,
      'text': text,
      'created_at': DateTime.now().toIso8601String(),
    };
    await supabase.from('announcements').insert(data);
  }

  @override
  Future<List<ClassStudent>> fetchClassStudents(String classId) async {
    final data = await supabase
        .from('users')
        .select('*, users_classes!inner(class_id)')
        .eq('users_classes.class_id', classId)
        .eq('user_role', 'student');
    return ClassStudent.fromMapList(data);
  }

  @override
  Future<List<StudentTeacher>> fetchStudentTeachers(String childId) async {
    final classData = await supabase
        .from('users_classes')
        .select('class_id')
        .eq('user_id', childId);
    final classIds = classData.map((d) => d['class_id']).toList();

    final data = await supabase
        .from('users')
        .select('*, users_classes!inner(class_id)')
        .inFilter('users_classes.class_id', classIds)
        .eq('user_role', 'teacher');
    return StudentTeacher.fromMapList(data);
  }

  @override
  Future<List<ChatMessage>> fetchChatMessages() async {
    final chatData = await supabase
        .from('chat')
        .select('id, chat_members!inner(chat_id, user_id)')
        .eq('chat_members.user_id)', userId!);
    final chatIds = chatData.map((cd) => cd['id']).toList();
    final data = await supabase
        .from('chat_messages')
        .select('*')
        .inFilter('chat_id', chatIds);
    return ChatMessage.fromMapList(data, userId!);
  }

  @override
  Future<void> sendMessage(String message, String otherUserId) async {
    final otherChatData = await supabase
        .from('chat')
        .select('id, chat_members!inner(chat_id, user_id)')
        .eq('chat_members.user_id', otherUserId);
    final myChatData = await supabase
        .from('chat')
        .select('id, chat_members!inner(chat_id, user_id)')
        .eq('chat_members.user_id', userId!);

    String? chatId = otherChatData.map<String?>(
      (ocd) {
        final matchedChat = myChatData.firstWhere(
          (mcd) => mcd['id'] == ocd['id'],
          orElse: () => {'id': null},
        );

        return matchedChat['id'];
      },
    ).firstWhere(
      (id) => id != null,
      orElse: () => null,
    );

    if (chatId == null) {
      // No common chat exists, so create a DM chat with this user
      chatId = const UuidV4().generate();
      await supabase.from('chat').insert({'id': chatId, 'name': ''});
      await supabase.from('chat_members').insert(
        {'chat_id': chatId, 'new_messages': false, 'user_id': userId!},
      );
      await supabase.from('chat_members').insert(
        {'chat_id': chatId, 'new_messages': true, 'user_id': otherUserId},
      );
    }

    await supabase.from('chat_messages').insert(
      {
        'id': const UuidV4().generate(),
        'chat_id': chatId,
        'text': message,
        'sent_at': DateTime.now().toIso8601String(),
        'sender_id': userId!
      },
    );
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
