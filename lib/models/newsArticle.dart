import 'dart:convert';

import 'package:first_app/services/webservice.dart';
import 'package:first_app/utils/constants.dart';

class NewsArticle {
  
  final String id; 
  final String title; 
  final String thumbnailUrl; 

  NewsArticle({this.id, this.title, this.thumbnailUrl});

  factory NewsArticle.fromJson(Map<String,dynamic> json) {
    return NewsArticle(
      id: json['id'], 
      title: json['title'], 
      thumbnailUrl: json['thumbnailUrl'] ?? Constants.NEWS_PLACEHOLDER_IMAGE_ASSET_URL
    );
  
}

  static Resource<List<NewsArticle>> get all {
    
    return Resource(
      url: Constants.HEADLINE_NEWS_URL,
      parse: (response) {
        final result = json.decode(response.body); 
        Iterable list = result['articles'];
        return list.map((model) => NewsArticle.fromJson(model)).toList();
      }
    );

  }

}