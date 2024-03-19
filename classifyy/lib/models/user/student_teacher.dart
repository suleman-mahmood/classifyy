class StudentTeacher {
  final String id;
  final String teacherName;

  const StudentTeacher({
    required this.id,
    required this.teacherName,
  });

  static List<StudentTeacher> fromMapList(List<Map<String, dynamic>> data) {
    return data.map<StudentTeacher>((d) => StudentTeacher.fromMap(d)).toList();
  }

  factory StudentTeacher.fromMap(Map<String, dynamic> map) {
    return StudentTeacher(
      id: map['id'],
      teacherName: map['display_name'],
    );
  }
}
