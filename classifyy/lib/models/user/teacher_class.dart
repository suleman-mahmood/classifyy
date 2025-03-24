class TeacherClass {
  final String id;
  final String displayName;

  TeacherClass({
    required this.id,
    required this.displayName,
  });

  static List<TeacherClass> fromMapList(List<dynamic> data) {
    return data.map<TeacherClass>((d) => TeacherClass.fromMap(d)).toList();
  }

  factory TeacherClass.fromMap(Map<String, dynamic> map) {
    return TeacherClass(
      id: map['id'],
      displayName: map['display_name'],
    );
  }
}
