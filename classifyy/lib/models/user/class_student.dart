class ClassStudent {
  final String id;
  final String studentName;

  const ClassStudent({
    required this.id,
    required this.studentName,
  });

  static List<ClassStudent> fromMapList(List<Map<String, dynamic>> data) {
    return data.map<ClassStudent>((d) => ClassStudent.fromMap(d)).toList();
  }

  factory ClassStudent.fromMap(Map<String, dynamic> map) {
    return ClassStudent(
      id: map['id'],
      studentName: map['display_name'],
    );
  }
}
