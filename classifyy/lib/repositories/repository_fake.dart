import 'package:classifyy/models/announcement/announcement.dart';
import 'package:classifyy/models/user/class.dart';
import 'package:classifyy/models/user/student.dart';
import 'package:classifyy/models/user/user.dart';
import 'package:classifyy/repositories/repository.dart';

class FakeRepository implements Repository {
  @override
  String? authToken;

  FakeRepository({this.authToken});

  @override
  Future<void> loginUser(String email, String password) {
    return Future.delayed(
      const Duration(seconds: 1),
      () {},
    );
  }

  @override
  Future<List<Class>> fetchClasses() {
    return Future.delayed(
      const Duration(seconds: 1),
      () => [
        Class(className: 'I-A'),
        Class(className: 'II-B'),
        Class(className: 'II-C'),
      ],
    );
  }

  @override
  Future<String> getAuthToken() {
    // TODO: implement getAuthToken
    throw UnimplementedError();
  }

  @override
  Future<User> getUser() {
    return Future.delayed(
      const Duration(seconds: 1),
      () => User(id: 'user_1', userType: UserType.teacher),
    );
  }

  @override
  Future<List<Student>> fetchChildren() {
    return Future.delayed(
      const Duration(seconds: 1),
      () => [
        Student(studentName: 'Faraz'),
        Student(studentName: 'Fawaz'),
        Student(studentName: 'Abdullah'),
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
}
