class DemoInfo {
  final int id;
  final String? title;

  const DemoInfo({required this.id, this.title});

  factory DemoInfo.fromMap(Map<String, dynamic> map) {
    final id = map["id"] as int?;
    final title = map["title"] as String?;

    return DemoInfo(id: id ?? -1, title: title);
  }

  Map<String, dynamic> toMap() {
    return {"id": id, "title": title};
  }
}
