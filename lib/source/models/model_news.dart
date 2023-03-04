import 'package:news_app_task/source/models/model_news_article.dart';

class ModelOfNews {
  String? status;
  int? totalResults;
  List<NewsArticles>? articles;

  ModelOfNews({this.status, this.totalResults, this.articles});

  ModelOfNews.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = <NewsArticles>[];
      json['articles'].forEach((v) {
        articles!.add(NewsArticles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['totalResults'] = totalResults;
    if (articles != null) {
      data['articles'] = articles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
