enum UserRole { student, parent, teacher, school_admin }

class UserModel {
  final String id;
  final String displayName;
  final String firstName;
  final String lastName;
  final String? loginQr;
  final String email;
  final String? phoneNumber;
  final UserRole userRole;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserModel({
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

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      displayName: map['display_name'],
      firstName: map['first_name'],
      lastName: map['last_name'],
      loginQr: map['login_qr'],
      email: map['email'],
      phoneNumber: map['phone_number'],
      userRole: UserRole.values.byName(map['user_role']),
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: DateTime.parse(map['updated_at']),
    );
  }

  String userRoleToSelectTitle() {
    if (userRole == UserRole.parent) return "child";
    if (userRole == UserRole.teacher) return "class";

    return "";
  }
}
