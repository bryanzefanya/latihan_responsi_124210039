import 'package:flutter/material.dart';
import 'package:latihan_responsi/api_data_sources.dart';
import 'package:latihan_responsi/news_model.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Blog"),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: ApiDataSource.instance.loadBlogs(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Error!");
          }
          if (snapshot.hasData) {
            List<Map<String, dynamic>> blogList = snapshot.data as List<Map<String, dynamic>>;
            return ListView.builder(
              itemCount: blogList.length,
              itemBuilder: (context, index) {
                var news = NewsModel.fromJson(blogList[index]);
                return ListTile(
                  title: Text(news.title!),
                  subtitle: Text(news.url!),
                  // Add more details as needed
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
