import 'package:classifyy/models/announcement/announcement.dart';
import 'package:classifyy/models/chat/chat_message.dart';
import 'package:classifyy/models/user/teacher_class.dart';
import 'package:classifyy/models/user/class_student.dart';
import 'package:classifyy/models/user/parent_child.dart';
import 'package:classifyy/models/user/student_teacher.dart';
import 'package:classifyy/models/user/user.dart';
import 'package:classifyy/repositories/repository.dart';

class FakeRepository implements Repository {
  @override
  String? authToken;

  FakeRepository({this.authToken});

  @override
  Future<String> loginUser(String email, String password) {
    return Future.delayed(
      const Duration(seconds: 1),
      () => email,
    );
  }

  @override
  Future<List<TeacherClass>> fetchClasses() {
    return Future.delayed(
      const Duration(seconds: 1),
      () => [
        TeacherClass(
          id: '1',
          displayName: 'I-A',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
        TeacherClass(
          id: '2',
          displayName: 'II-B',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
        TeacherClass(
          id: '3',
          displayName: 'II-C',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      ],
    );
  }

  @override
  Future<String> getAuthToken() {
    // TODO: implement getAuthToken
    throw UnimplementedError();
  }

  @override
  Future<User> getUser(String id) {
    return Future.delayed(
      const Duration(seconds: 1),
      () => User(
        id: 'user_1',
        displayName: '',
        firstName: '',
        lastName: '',
        loginQr: '',
        email: '',
        phoneNumber: '',
        userRole: id == 'te'
            ? UserRole.teacher
            : (id == 'pa' ? UserRole.parent : UserRole.student),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    );
  }

  @override
  Future<List<ParentChild>> fetchChildren() {
    return Future.delayed(
      const Duration(seconds: 1),
      () => [
        ParentChild(id: '1', displayName: 'Faraz'),
        ParentChild(id: '2', displayName: 'Fawaz'),
        ParentChild(id: '3', displayName: 'Abdullah'),
      ],
    );
  }

  @override
  Future<List<Announcement>> fetchAnnouncements(int startIndex, int endIndex) {
    return Future.delayed(
      const Duration(seconds: 1),
      () => [
        Announcement(
          id: '1',
          text: 'Important message',
          createdAt: DateTime.now().subtract(const Duration(days: 1)),
          announcerId: 'user_1',
          announcerDisplayName: 'Momin Ahmed',
          announcerRole: UserRole.teacher,
        ),
        Announcement(
          id: '2',
          text: 'Another important message',
          createdAt: DateTime.now().subtract(const Duration(hours: 5)),
          announcerId: 'user_2',
          announcerDisplayName: 'Imtiaz Bahadur',
          announcerRole: UserRole.teacher,
        ),
        Announcement(
          id: '3',
          text: 'Super important message',
          createdAt: DateTime.now().subtract(const Duration(
            days: 3,
            hours: 10,
          )),
          announcerId: 'user_3',
          announcerRole: UserRole.schoolAdmin,
        ),
      ],
    );
  }

  @override
  Future<void> createAnnouncement(String text) async {
    return Future.delayed(
      const Duration(seconds: 1),
      () {},
    );
  }

  @override
  Future<List<ClassStudent>> fetchClassStudents() {
    return Future.delayed(
      const Duration(seconds: 1),
      () => [
        const ClassStudent(id: '1', studentName: 'Abdullah Khan'),
        const ClassStudent(id: '2', studentName: 'Fawaz Ahmad'),
        const ClassStudent(id: '3', studentName: 'Shah Faraz ul Haq'),
        const ClassStudent(id: '4', studentName: 'Ahmed Sheikhani'),
        const ClassStudent(id: '5', studentName: 'Mahnoor Malik'),
      ],
    );
  }

  @override
  Future<List<ChatMessage>> fetchChatMessages() {
    return Future.delayed(
      const Duration(seconds: 1),
      () => [
        ChatMessage(
          id: '1',
          text: 'Aoa',
          sentAt: DateTime.now(),
          chatMessageType: ChatMessageType.otherUser,
        ),
        ChatMessage(
          id: '1',
          text: 'Woa',
          sentAt: DateTime.now(),
          chatMessageType: ChatMessageType.currentUser,
        ),
        ChatMessage(
          id: '1',
          text: 'Apka bacha time pe nahi aya',
          sentAt: DateTime.now(),
          chatMessageType: ChatMessageType.otherUser,
        ),
        ChatMessage(
          id: '1',
          text: 'Wops',
          sentAt: DateTime.now(),
          chatMessageType: ChatMessageType.currentUser,
        ),
        ChatMessage(
          id: '1',
          text: 'Tang kheechta hun main uski',
          sentAt: DateTime.now(),
          chatMessageType: ChatMessageType.currentUser,
        ),
        ChatMessage(
          id: '1',
          text: 'Theek hai',
          sentAt: DateTime.now(),
          chatMessageType: ChatMessageType.otherUser,
        ),
        ChatMessage(
          id: '1',
          text: 'Thank you miss!',
          sentAt: DateTime.now(),
          chatMessageType: ChatMessageType.currentUser,
        ),
      ],
    );
  }

  @override
  Future<List<StudentTeacher>> fetchStudentTeachers() {
    return Future.delayed(
      const Duration(seconds: 1),
      () => [
        const StudentTeacher(id: '1', teacherName: 'Zafar Ali Khan'),
        const StudentTeacher(id: '2', teacherName: 'Raja Shafqat'),
        const StudentTeacher(id: '3', teacherName: 'Nausheen Iqbal'),
        const StudentTeacher(id: '4', teacherName: 'Sana Khan'),
        const StudentTeacher(id: '5', teacherName: 'Kashif Ali'),
      ],
    );
  }
}
