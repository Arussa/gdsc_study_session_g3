// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:newsapp/structure/articlestructure.dart';
import 'package:http/http.dart' as http;

class NewsRepository {
  Future<List<ArticleModel>> fetchNews() async {
    try {
      var answer = await http.get(Uri.parse(
          "https://newsapi.org/v2/top-headlines?country=us&apiKey=af6f41d6a73b4196ae816b0ebb3b755c"));

      if (answer.statusCode == 200) {
        var data = jsonDecode(answer.body);
        if (data != null && data["articles"] != null) {
          List<ArticleModel> articleModelList = [];
          for (var item in data["articles"]) {
            try {
              if (item != null) {
                ArticleModel amodel = ArticleModel.fromJson(item);
                articleModelList.add(amodel);
              }
            } catch (e) {
              print('Error parsing item: $item');
              print('Parsing error: $e');
            }
          }
          return articleModelList;
        } else {
          print("Null values encountered in JSON data");
        }
      } else {
        print('HTTP error: ${answer.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
    return [];
  }
}
