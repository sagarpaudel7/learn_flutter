class NotesModel {
  final int? id;
  final String title;
  final int age;
  final String desc;
  final String email;

  NotesModel({this.id, required this.title, required this.age, required this.desc, required this.email});

  NotesModel.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        title = res["title"],
        age = res["age"],
        desc = res["desc"],
        email = res["email"];
  Map<String, Object?> toMap() {
    return {
      "id": id,
      "title": title,
      "age": age,
      "desc": desc,
      "email": email,
    };
  }
}
