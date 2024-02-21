import 'package:classifyy/models/announcement/announcement.dart';
import 'package:classifyy/models/user/class.dart';
import 'package:classifyy/models/user/student.dart';
import 'package:classifyy/models/user/user.dart';

abstract class Repository {
  String? authToken;

  Repository({this.authToken});

  Future<void> loginUser(String email, String password);

  Future<List<Class>> fetchClasses();

  Future<List<Student>> fetchChildren();

  Future<String> getAuthToken();

  Future<User> getUser();

  Future<List<Announcement>> fetchAnnouncements(int startIndex, int endIndex);
}
