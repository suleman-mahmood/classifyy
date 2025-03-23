// ignore: constant_identifier_names
enum UserRole { Student, Parent, Teacher, SchoolAdmin }

class UserModel {
  final String id;
  final String displayName;
  final String email;
  final String? phoneNumber;
  final UserRole userRole;

  UserModel({
    required this.id,
    required this.displayName,
    required this.email,
    required this.phoneNumber,
    required this.userRole,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      displayName: map['display_name'],
      email: map['email'],
      phoneNumber: map['phone_number'],
      userRole: UserRole.values.byName(map['user_role']),
    );
  }

  String userRoleToSelectTitle() {
    if (userRole == UserRole.Parent) return "child";
    if (userRole == UserRole.Teacher) return "class";

    return "";
  }
}
