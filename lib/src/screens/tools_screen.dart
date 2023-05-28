import 'package:flutter/material.dart';
import 'package:aihunt/src/services/api_services.dart';

class ToolsPage extends StatefulWidget {
  const ToolsPage({super.key});

  @override
  State<ToolsPage> createState() => _ToolsPageState();
}

class _ToolsPageState extends State<ToolsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: ApiServices().getTools(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var tools = snapshot.data;
                if (tools != null) {
                  return ListView.builder(
                      itemBuilder: (context, index) {
                        var tooldata = tools['data'][index];
                        return Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(children: [
                              Text(tooldata["title"],
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.merge(
                                        TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blueAccent[100]),
                                      )),
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: Text(tooldata["gpt33"]['heading'],
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.merge(
                                          const TextStyle(
                                              color: Colors.black54,
                                              fontSize: 22),
                                        )),
                              ),
                            ]),
                          ),
                        );
                      },
                      itemCount: snapshot.data?['data'].length);
                }
              }
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.blueAccent,
                ),
              );
            }));
  }
}
