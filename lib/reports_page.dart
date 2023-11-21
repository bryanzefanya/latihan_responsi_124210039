import 'package:flutter/material.dart';
import 'package:latihan_responsi/api_data_sources.dart';
import 'package:latihan_responsi/reports_model.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reports"),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: ApiDataSource.instance.loadReports(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Error!");
          }
          if (snapshot.hasData) {
            List<Map<String, dynamic>> ReportsList = snapshot.data as List<Map<String, dynamic>>;
            return ListView.builder(
              itemCount: ReportsList.length,
              itemBuilder: (context, index) {
                var news = ReportsModel.fromJson(ReportsList[index]);
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
