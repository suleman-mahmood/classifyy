class ClassStudent {
  final String id;
  final String? parentId;
  final String displayName;

  const ClassStudent({
    required this.id,
    this.parentId,
    required this.displayName,
  });

  static List<ClassStudent> fromMapList(List<Map<String, dynamic>> data) {
    return data.map<ClassStudent>((d) => ClassStudent.fromMap(d)).toList();
  }

  factory ClassStudent.fromMap(Map<String, dynamic> map) {
    return ClassStudent(
      id: map['id'],
      parentId: map['parent_user_id'],
      displayName: map['display_name'],
    );
  }
}
