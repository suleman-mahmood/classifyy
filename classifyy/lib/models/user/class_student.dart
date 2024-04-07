class ClassStudent {
  final String id;
  final String? parentId;
  final String studentName;

  const ClassStudent({
    required this.id,
    this.parentId,
    required this.studentName,
  });

  static List<ClassStudent> fromMapList(List<Map<String, dynamic>> data) {
    return data.map<ClassStudent>((d) => ClassStudent.fromMap(d)).toList();
  }

  factory ClassStudent.fromMap(Map<String, dynamic> map) {
    return ClassStudent(
      id: map['id'],
      parentId: map['parent_id'],
      studentName: map['display_name'],
    );
  }
}
