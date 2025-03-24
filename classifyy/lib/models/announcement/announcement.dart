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

  static List<Announcement> fromMapList(List<dynamic> data) {
    return data.map<Announcement>((d) => Announcement.fromMap(d)).toList();
  }

  factory Announcement.fromMap(Map<String, dynamic> map) {
    return Announcement(
      id: map['id'],
      text: map['content'],
      createdAt: DateTime.parse(map['created_at']),
      announcerId: map['announcer_user_id'],
      announcerRole: UserRole.values.byName(map['announcer_user_role']),
      announcerDisplayName: map['users']['announcer_display_name'],
    );
  }
}
