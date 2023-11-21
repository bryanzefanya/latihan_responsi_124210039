import 'package:flutter/material.dart';
import 'package:latihan_responsi/api_data_sources.dart';
import 'package:latihan_responsi/news_model.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News"),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: ApiDataSource.instance.loadNews(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Error!");
          }
          if (snapshot.hasData) {
            List<Map<String, dynamic>> newsList = snapshot.data as List<Map<String, dynamic>>;
            return ListView.builder(
              itemCount: newsList.length,
              itemBuilder: (context, index) {
                var news = NewsModel.fromJson(newsList[index]);
                return ListTile(
                  title: Text(news.title!),
                  subtitle: Text(news.url!),
                  // Add more details as needed
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
