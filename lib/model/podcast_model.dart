import 'package:tecblog/components/api_constatnt.dart';

class PodcastModel {
  String? id;
  String? title;
  String? image;
  String? publisher;
  String? view;
  String? createdAt;

  PodcastModel(
      {this.title,
      this.id,
      this.image,
      this.publisher,
      this.view,
      this.createdAt});

  PodcastModel.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    id = json["id"];
    image = ApiConstant.hostUrl + json["poster"];
    publisher = json["publisher"];
    view = json["view"];
    createdAt = json["created_at"];
  }
}
