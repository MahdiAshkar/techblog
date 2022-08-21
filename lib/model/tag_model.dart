class TagModel {
  String? id;
  String? title;

  TagModel({
    this.title,
    this.id,
  });

  TagModel.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    id = json["id"];
  }
}
