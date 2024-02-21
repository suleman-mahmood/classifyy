import 'package:classifyy/models/announcement/announcement.dart';
import 'package:classifyy/models/user/class.dart';
import 'package:classifyy/models/user/student.dart';
import 'package:classifyy/models/user/user.dart';
import 'package:classifyy/repositories/repository.dart';

class ImpRepository implements Repository {
  @override
  String? authToken;

  ImpRepository({this.authToken});

  @override
  Future<void> loginUser(String email, String password) {
    // TODO: implement loginUser
    throw UnimplementedError();
  }

  @override
  Future<List<Class>> fetchClasses() {
    // TODO: implement fetchClasses
    throw UnimplementedError();
  }

  @override
  Future<String> getAuthToken() {
    // TODO: implement getAuthToken
    throw UnimplementedError();
  }

  @override
  Future<User> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<List<Student>> fetchChildren() {
    // TODO: implement fetchChildren
    throw UnimplementedError();
  }

  @override
  Future<List<Announcement>> fetchAnnouncements(int startIndex, int endIndex) {
    // TODO: implement fetchAnnouncements
    throw UnimplementedError();
  }
}
