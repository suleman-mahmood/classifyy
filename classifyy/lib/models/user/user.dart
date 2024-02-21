enum UserRole { student, parent, teacher, schoolAdmin }

enum UserType { student, parent, teacher, schoolAdmin }

class User {
  final String id;
  final UserType userType;

  User({required this.id, required this.userType});

  String userTypeToSelectTitle() {
    if (userType == UserType.parent) return "child";
    if (userType == UserType.teacher) return "class";

    return "";
  }
}
