class ParentChild {
  final String id;
  final String displayName;

  ParentChild({
    required this.id,
    required this.displayName,
  });

  static List<ParentChild> fromMapList(List<dynamic> data) {
    return data.map<ParentChild>((d) => ParentChild.fromMap(d)).toList();
  }

  factory ParentChild.fromMap(Map<String, dynamic> map) {
    return ParentChild(
      id: map['id'],
      displayName: map['display_name'],
    );
  }
}
