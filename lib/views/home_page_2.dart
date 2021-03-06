import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/data/data.dart';
import 'package:flutter_news/data/my_info.dart';
import 'package:flutter_news/helper_functions/get_source_news.dart';
import 'package:flutter_news/helper_functions/trending_news.dart';
import 'package:flutter_news/models/article_model.dart';
import 'package:flutter_news/models/categorie_model.dart';
import 'package:flutter_news/views/categorie_view.dart';
import 'package:flutter_news/widgets/widget.dart';
import 'package:extended_tabs/extended_tabs.dart';
import 'package:animations/animations.dart';

class HomePage2 extends StatefulWidget {
  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2>
    with SingleTickerProviderStateMixin {
  List<CategorieModel> categories = new List();
  List<ArticleModel> articles = new List();
  List<CategorieModel> sources = new List();

  bool _loading;
  var newsList;
  TabController tabController;
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

    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      if (tabController.index == 0) {
        indexTab = 0;
      } else {
        indexTab = 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: missing_required_param
    return Scaffold(
      appBar: AppBar(
        title: AppName(),
        elevation: 0.0,
        centerTitle: true,
        bottom: TabBar(
          unselectedLabelColor: Colors.grey,
          isScrollable: false,
          indicatorColor: Colors.blue[600],
          indicatorWeight: 3,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorPadding: EdgeInsets.symmetric(horizontal: 12.0),
          controller: tabController,
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
        child: ExtendedTabBarView(
          controller: tabController,
          children: [
            Scaffold(
              body: Container(
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
              floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.white,                
                child: Icon(
                  Icons.brightness_6_sharp,
                  color: Colors.black,
                ),
                onPressed: () {
                  switchTheme();
                },
              ),
            ),
            Container(
              //margin: EdgeInsets.only(top: 10),
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 1.7,
                mainAxisSpacing: 6,
                crossAxisSpacing: 5,
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16.0),
                children: categories.map((category) {
                  return CategorieTile2(
                    imgUrl: category.imgUrl,
                    title: category.categorieName,
                  );
                }).toList(),
              ),
            ),
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: GridView.count(
                //itemCount: sources.length,
                crossAxisCount: 2,
                physics: ClampingScrollPhysics(),
                childAspectRatio: 1.6,
                shrinkWrap: true,
                mainAxisSpacing: 6,
                crossAxisSpacing: 7,
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16.0),
                children: sources.map((source) {
                  return CategorieTile3(
                    imgUrl: source.imgUrl,
                    title: source.categorieName,
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void switchTheme() {
    DynamicTheme.of(context).setBrightness(
        Theme.of(context).brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark);
  }
}
