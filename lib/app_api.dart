import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/news_response.dart';

class AppApi {
  Future<NewsResponse> getNews() async {
    //https://newsapi.org/v2/everything?q=bitcoin&apiKey=f7a92e9755bf42baa381e09e1fdb2900
    Uri url = Uri.https("newsapi.org", "/v2/everything", {
      "apiKey": "f7a92e9755bf42baa381e09e1fdb2900",
      "q": "bitcoin",
    });
    var response = await http.get(url);
    var body = response.body;
    var json = jsonDecode(body);
    return NewsResponse.fromJson(json);
  }
}
