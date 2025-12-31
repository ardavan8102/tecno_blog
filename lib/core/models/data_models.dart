class HashTag {

  String? title;

  HashTag({
    required this.title
  });

}

class BlogModel {

  int? id;
  String? imageUrl;
  String? title;
  String? writer;
  String? writerImageUrl;
  String? date;
  String? content;
  String? views;

  BlogModel({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.writer,
    required this.writerImageUrl,
    required this.date,
    required this.content,
    required this.views,
  });

}

class PodCastModel {

  int? id;
  String? imageUrl;
  String? title;
  String? podcaster;
  String? podcasterImageUrl;
  String? date;
  List<Map<String, String>> episodes;
  String? listens;

  PodCastModel({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.podcaster,
    required this.podcasterImageUrl,
    required this.date,
    required this.episodes,
    required this.listens,
  });

}