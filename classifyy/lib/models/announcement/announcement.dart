import 'package:classifyy/models/user/user.dart';

class Announcement {
  final String id;
  final String text;
  final DateTime createdAt;

  final String announcerId;
  final UserRole announcerRole;
  final String? announcerDisplayName;

  Announcement({
    required this.id,
    required this.text,
    required this.createdAt,
    
    required this.announcerId,
    required this.announcerRole,
    this.announcerDisplayName,
  });
}
