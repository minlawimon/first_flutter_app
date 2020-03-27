import 'package:first_app/models/newsArticle.dart';
import 'package:first_app/services/webservice.dart';
import 'package:first_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewsListState extends State<NewsList> {

  List<NewsArticle> _newsArticles = List<NewsArticle>(); 

  @override
  void initState() {
    super.initState();
    _populateNewsArticles(); 
  }

  void _populateNewsArticles() {
   
    Webservice().load(NewsArticle.all).then((newsArticles) => {
      setState(() => {
        _newsArticles = newsArticles
      })
    });

  }

  ListTile _buildItemsForListView(BuildContext context, int index) {
      return ListTile(
        title: _newsArticles[index].thumbnailUrl == null ? Image.asset(Constants.NEWS_PLACEHOLDER_IMAGE_ASSET_URL) : Image.network(_newsArticles[index].thumbnailUrl), 
        subtitle: Text(_newsArticles[index].title, style: TextStyle(fontSize: 18)),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
          itemCount: _newsArticles.length,
          itemBuilder: _buildItemsForListView,
        )
      );
  }
}

class NewsList extends StatefulWidget {

  @override
  createState() => NewsListState(); 
}