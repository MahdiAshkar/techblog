class HashTag {
  String title;
  HashTag({required this.title});
}

class BlogModel {
  int id;
  String imageUrl;
  String writer;
  String writerProfile;
  String content;
  String title;
  String views;
  String date;
  BlogModel(
      {required this.id,
      required this.imageUrl,
      required this.writer,
      required this.content,
      required this.date,
      required this.views,
      required this.title,
      required this.writerProfile});
}

class PodcastModel {
  int id;
  String imageUrl;
  String writer;
  String title;

  PodcastModel({
    required this.id,
    required this.imageUrl,
    required this.writer,
    required this.title,
  });
}
