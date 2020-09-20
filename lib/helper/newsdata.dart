import 'dart:convert';

import 'package:NewsApp308/models/articleModel.dart';
import 'package:http/http.dart' as http;

class news {
  List<articleModel> newslist = [];

  Future<void> getnewsmain() async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=in&apiKey=d98f3284f1474152ab697e82886da2b9";

    var response = await http.get(url);

    var jsondata = jsonDecode(response.body);

    if (jsondata["status"] == "ok") {
      jsondata["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          articleModel articlemodel = new articleModel(
            Title: element["title"],
            Desc: element["description"],
            ImageUrl: element["urlToImage"],
            Url: element["url"],
            author: element["source"]["name"],
          );

          newslist.add(articlemodel);
        }
      });
    }
  }
}

class categorynew {
  List<articleModel> categorynewslist = [];

  Future<void> getnewsmain(String categorychoosed) async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=in&category=$categorychoosed&apiKey=d98f3284f1474152ab697e82886da2b9";
    //print(categorychoosed + "hi hi");
    var response = await http.get(url);

    var jsondata = jsonDecode(response.body);

    if (jsondata["status"] == "ok") {
      jsondata["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          articleModel articlemodel = new articleModel(
            Title: element["title"],
            Desc: element["description"],
            ImageUrl: element["urlToImage"],
            Url: element["url"],
            author: element["source"]["name"],
          );

          categorynewslist.add(articlemodel);
        }
      });
    }
  }
}
