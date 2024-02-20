enum UserType {
  Student,
  Parent,
  Teacher,
  SchoolAdmin,
}

class User {
  final UserType userType;

  User({required this.userType});

  String userTypeToSelectTitle() {
    if (userType == UserType.Parent) return "child";
    if (userType == UserType.Teacher) return "class";

    return "";
  }
}
