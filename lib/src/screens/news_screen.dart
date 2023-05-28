import 'package:flutter/material.dart';
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
                        child: Card(
                          elevation: 3,
                          shadowColor: Colors.black,
                          margin: const EdgeInsets.all(16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(9.0),
                                child: Image.network(
                                  Uri.parse(
                                          'https://www.aitoolhunt.com/_next/image')
                                      .replace(
                                    queryParameters: {
                                      'url': news['thumbnail'],
                                      'q': '85',
                                      'w': '1920',
                                    },
                                  ).toString(),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 8, 16, 4),
                                child: Text(
                                  news["metadata"]["title"],
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 2, 16, 18),
                                child: Text(
                                  news["metadata"]["description"],
                                  style: const TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 2, 16, 18),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundImage: news['icon'] != null
                                          ? NetworkImage(
                                              Uri.parse(
                                                      'https://www.aitoolhunt.com/_next/image')
                                                  .replace(
                                                queryParameters: {
                                                  'url': news['icon'],
                                                  'q': '60',
                                                  'w': '1080',
                                                },
                                              ).toString(),
                                            )
                                          : null,
                                    ),
                                    Text(
                                        style: const TextStyle(
                                            fontSize: 18, color: Colors.black),
                                        DateTime.fromMicrosecondsSinceEpoch(
                                                news['datetime'])
                                            .toString()
                                            .substring(0, 10)),
                                  ],
                                ),
                              ),
                              // const Padding(padding: EdgeInsets.all(16))
                            ],
                          ),
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
