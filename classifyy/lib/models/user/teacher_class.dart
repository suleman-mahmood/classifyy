class TeacherClass {
  final String id;
  final String displayName;
  final DateTime createdAt;
  final DateTime updatedAt;

  TeacherClass({
    required this.id,
    required this.displayName,
    required this.createdAt,
    required this.updatedAt,
  });

  static List<TeacherClass> fromMapList(List<Map<String, dynamic>> data) {
    return data.map<TeacherClass>((d) => TeacherClass.fromMap(d)).toList();
  }

  factory TeacherClass.fromMap(Map<String, dynamic> map) {
    return TeacherClass(
      id: map['id'],
      displayName: map['display_name'],
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: DateTime.parse(map['updated_at']),
    );
  }
}
