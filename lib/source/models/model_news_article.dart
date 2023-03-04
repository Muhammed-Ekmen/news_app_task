import 'package:news_app_task/source/models/model_news_source.dart';

class NewsArticles {
  NewsSource? source;
  String? author;
  String? title;
  dynamic description;
  String? url;
  dynamic urlToImage;
  String? publishedAt;
  dynamic content;

  NewsArticles({this.source, this.author, this.title, this.description, this.url, this.urlToImage, this.publishedAt, this.content});

  NewsArticles.fromJson(Map<String, dynamic> json) {
    source = json['source'] != null ? NewsSource.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (source != null) {
      data['source'] = source!.toJson();
    }
    data['author'] = author;
    data['title'] = title;
    data['description'] = description;
    data['url'] = url;
    data['urlToImage'] = urlToImage;
    data['publishedAt'] = publishedAt;
    data['content'] = content;
    return data;
  }
}
