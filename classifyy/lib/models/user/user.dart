enum UserRole { student, parent, teacher, schoolAdmin }

class User {
  final String id;
  final String displayName;
  final String firstName;
  final String lastName;
  final String loginQr;
  final String email;
  final String phoneNumber;
  final UserRole userRole;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.id,
    required this.displayName,
    required this.firstName,
    required this.lastName,
    required this.loginQr,
    required this.email,
    required this.phoneNumber,
    required this.userRole,
    required this.createdAt,
    required this.updatedAt,
  });

  String userRoleToSelectTitle() {
    if (userRole == UserRole.parent) return "child";
    if (userRole == UserRole.teacher) return "class";

    return "";
  }
}
