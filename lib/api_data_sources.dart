import 'package:latihan_responsi/news_model.dart';

import 'base_network.dart';

class ApiDataSource {
  static ApiDataSource instance = ApiDataSource();

  Future<List<NewsModel>> loadNews() async {
    List<Map<String, dynamic>> newsList = await BaseNetwork.get("https://api.spaceflightnewsapi.net/v4/articles/?format=json");
    return newsList.map((map) => NewsModel.fromJson(map)).toList();
  }

  Future<List<NewsModel>> loadBlogs() async {
    List<Map<String, dynamic>> newsList = await BaseNetwork.get("https://api.spaceflightnewsapi.net/v4/blogs/?format=json");
    return newsList.map((map) => NewsModel.fromJson(map)).toList();
  }

  Future<List<NewsModel>> loadReports() async {
    List<Map<String, dynamic>> newsList = await BaseNetwork.get("https://api.spaceflightnewsapi.net/v4/reports/?format=json");
    return newsList.map((map) => NewsModel.fromJson(map)).toList();
  }
}
