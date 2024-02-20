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
      () => User(userType: UserType.Teacher),
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
}
