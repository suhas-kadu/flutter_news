import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/data/data.dart';
import 'package:flutter_news/helper_functions/get_source_news.dart';
import 'package:flutter_news/helper_functions/trending_news.dart';
import 'package:flutter_news/models/article_model.dart';
import 'package:flutter_news/models/categorie_model.dart';
import 'package:flutter_news/widgets/widget.dart';

class HomePage2 extends StatefulWidget {
  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  List<CategorieModel> categories = new List();
  List<ArticleModel> articles = new List();
  List<CategorieModel> sources = new List();

  bool _loading;
  var newsList;
  TabController _tabController;
  int indexTab = 0;

  void getTrendingNews() async {
    News news = News();
    await news.getTrendingNews();
    articles = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    _loading = true;
    super.initState();
    categories = getCategories();
    getTrendingNews();
    sources = getSources();
    //_tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: AppName(),
            elevation: 0.0,
            centerTitle: true,
            bottom: TabBar(
              onTap: (index) {
                setState(() {
                  indexTab = index;
                });
              },
              tabs: [
                Tab(
                  text: "TRENDING",
                ),
                Tab(
                  text: "CATEGORIES",
                ),
                Tab(
                  text: "SOURCES",
                )
              ],
            ),
          ),
          body: DoubleBackToCloseApp(
            snackBar: SnackBar(
              content: Text("Tap again to exit "),
            ),
            child: TabBarView(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: 3),
                  child: ListView.builder(
                      itemCount: articles.length,
                      //shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return NewsTile(
                          imageUrl: articles[index].urlToImage ?? "",
                          title: articles[index].title ?? "",
                          description: articles[index].description ?? "",
                          content: articles[index].content ?? "",
                          postUrl: articles[index].url ?? "",
                          author: articles[index].author ?? "",
                          publishedAt: articles[index].publishedAt ?? "",
                        );
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      itemCount: categories.length,
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16.0),
                      
                      itemBuilder: (context, index) {
                        return CategorieTile2(
                          imgUrl: categories[index].imgUrl,
                          title: categories[index].categorieName,
                        );
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      itemCount: sources.length,
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      itemBuilder: (context, index) {
                        return CategorieTile3(
                          imgUrl: sources[index].imgUrl,
                          title: sources[index].categorieName,
                        );
                      }),
                ),
               
              ],
            ),
          ),
          floatingActionButton: indexTab == 0
              ? FloatingActionButton(
                  //heroTag: ,
                  onPressed: switchTheme,
                  child: Icon(Icons.brightness_6_sharp),
                )
              : Text("")),
    );
  }

  void switchTheme() {
    DynamicTheme.of(context).setBrightness(
        Theme.of(context).brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark);
  }
}