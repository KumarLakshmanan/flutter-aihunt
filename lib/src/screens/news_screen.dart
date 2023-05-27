import 'package:flutter/material.dart';
import 'package:todoapp/src/constant.dart' as constant;
import 'package:todoapp/src/services/api_services.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: ApiServices().getNews(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var news = snapshot.data;
              if (news != null) {
                return ListView.builder(
                    itemCount: snapshot.data?["data"].length,
                    itemBuilder: (context, idx) {
                      var news = snapshot.data?["data"][idx];
                      return SizedBox(
                        child: ListBody(
                          children: [
                            Image.network(constant.Constants.apiUrl + news["thumbnail"]),
                            Text(
                              news["metadata"]["title"],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              }
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
