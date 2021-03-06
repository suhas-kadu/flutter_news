import 'package:flutter_news/models/categorie_model.dart';
import 'package:flutter/material.dart';

String apiKey = "876ba9b1472c4be0aee36557cf3070dd";
const MaterialColor white = const MaterialColor(
  0xFFFFFFFF,
  const <int, Color>{
    50: const Color(0xFFFFFFFF),
    100: const Color(0xFFFFFFFF),
    200: const Color(0xFFFFFFFF),
    300: const Color(0xFFFFFFFF),
    400: const Color(0xFFFFFFFF),
    500: const Color(0xFFFFFFFF),
    600: const Color(0xFFFFFFFF),
    700: const Color(0xFFFFFFFF),
    800: const Color(0xFFFFFFFF),
    900: const Color(0xFFFFFFFF),
  },
);

List<CategorieModel> getCategories() {
  List<CategorieModel> categories = new List();
  CategorieModel categorieModel = new CategorieModel();

  categorieModel.imgUrl =
      "https://images.pexels.com/photos/1190297/pexels-photo-1190297.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  categorieModel.categorieName = "Entertainment";
  categories.add(categorieModel);
  categorieModel = new CategorieModel();

  categorieModel.imgUrl =
      "https://images.pexels.com/photos/46798/the-ball-stadion-football-the-pitch-46798.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  categorieModel.categorieName = "Sports";
  categories.add(categorieModel);
  categorieModel = new CategorieModel();

  categorieModel.imgUrl =
      "https://images.pexels.com/photos/105028/pexels-photo-105028.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  categorieModel.categorieName = "Health";
  categories.add(categorieModel);
  categorieModel = new CategorieModel();

  categorieModel.imgUrl =
      "https://images.pexels.com/photos/3184418/pexels-photo-3184418.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  categorieModel.categorieName = "Business";
  categories.add(categorieModel);
  categorieModel = new CategorieModel();

  categorieModel.imgUrl =
      "https://images.pexels.com/photos/1714208/pexels-photo-1714208.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  categorieModel.categorieName = "Technology";
  categories.add(categorieModel);
  categorieModel = new CategorieModel();

  categorieModel.imgUrl =
      "https://images.pexels.com/photos/1366944/pexels-photo-1366944.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  categorieModel.categorieName = "Science";
  categories.add(categorieModel);
  categorieModel = new CategorieModel();

  return categories;
}

List<CategorieModel> getSources() {
  List<CategorieModel> sources = new List();
  CategorieModel categorieModel = new CategorieModel();

  categorieModel.imgUrl =
      "assets/images/bbc_news.png";
  categorieModel.categorieName = "BBC-News";
  sources.add(categorieModel);
  categorieModel = new CategorieModel();

  // categorieModel.imgUrl =
  //     "assets/images/abc_news.png";
  // categorieModel.categorieName = "ABC-News";
  // sources.add(categorieModel);
  // categorieModel = new CategorieModel();

  categorieModel.imgUrl =
      "assets/images/cnn_logo.png";
  categorieModel.categorieName = "CNN";
  sources.add(categorieModel);
  categorieModel = new CategorieModel();

   categorieModel.imgUrl =
      "assets/images/times_of_india.png";
  categorieModel.categorieName = "The-Times-of-India";
  sources.add(categorieModel);
  categorieModel = new CategorieModel();

  categorieModel.imgUrl = "assets/images/the_Hindu_times.png";
  categorieModel.categorieName = "The-Hindu";
  sources.add(categorieModel);
  categorieModel = new CategorieModel();


  categorieModel.imgUrl =
      "assets/images/mtv_img.png";
  categorieModel.categorieName = "MTV-News";
  sources.add(categorieModel);
  categorieModel = new CategorieModel();

  categorieModel.imgUrl =
      "assets/images/google_img.png";
  categorieModel.categorieName = "Google-News-in";
  sources.add(categorieModel);
  categorieModel = new CategorieModel();
  categorieModel.imgUrl =
      "assets/images/fox_img.png";
  categorieModel.categorieName = "Fox-News";
  sources.add(categorieModel);
  categorieModel = new CategorieModel();

  categorieModel.imgUrl =
      "assets/images/espn.png";
  categorieModel.categorieName = "ESPN";
  sources.add(categorieModel);
  categorieModel = new CategorieModel();

  
  categorieModel.imgUrl = "assets/images/buzzfeed.png";
  categorieModel.categorieName = "Buzzfeed";
  sources.add(categorieModel);
  categorieModel = new CategorieModel();

  categorieModel.imgUrl = "assets/images/img_Nat.png";
  categorieModel.categorieName = "National-Geographic";
  sources.add(categorieModel);
  categorieModel = new CategorieModel();

  // categorieModel.imgUrl = "assets/images/crypto_coins_news.png";
  // categorieModel.categorieName = "Crypto-Coins-News";
  // sources.add(categorieModel);
  // categorieModel = new CategorieModel();

  return sources;
}
