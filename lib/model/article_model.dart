import 'package:tecblog/components/api_constatnt.dart';

class ArticleModel {
  String? id;
  String? title;
  String? image;
  String? catId;
  String? view;
  String? author;
  String? catName;
  String? status;
  String? createdAt;

  ArticleModel(
      {this.id,
      this.author,
      this.title,
      this.view,
      this.catId,
      this.catName,
      this.createdAt,
      this.image,
      this.status});

  ArticleModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    author = json["author"];
    title = json["title"];
    view = json["view"];
    catId = json["cat_id"];
    catName = json["cat_name"];
    createdAt = json["created_at"];
    image = ApiConstant.hostUrl + json["image"];
    status = json["status"];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};

    data["id"] = id;
    data["author"] = author;
    data["title"] = title;
    data["view"] = view;
    data["cat_id"] = catId;
    data["created_at"] = createdAt;
    data["cat_name"] = catName;
    data["image"] = image;
    data["status"] = status;

    return data;
  }
}
