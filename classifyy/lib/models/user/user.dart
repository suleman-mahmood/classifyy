enum UserRole { student, parent, teacher, schoolAdmin }

class User {
  final String id;
  final UserRole userType;

  User({required this.id, required this.userType});

  String userTypeToSelectTitle() {
    if (userType == UserRole.parent) return "child";
    if (userType == UserRole.teacher) return "class";

    return "";
  }
}
