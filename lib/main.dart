import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/src/screens/news_screen.dart';
import 'package:todoapp/src/screens/tools_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const RootPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: TextTheme(
              bodyMedium: TextStyle(
                  fontFamily: GoogleFonts.abel().fontFamily,
                  fontWeight: FontWeight.normal,
                  color: Colors.black45),
              bodyLarge: TextStyle(
                  fontFamily: GoogleFonts.righteous().fontFamily,
                  fontSize: 22,
                  color: Colors.blueAccent[100]))),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int activeindex = 0;
  List<Map<String, dynamic>> pages = [
    {
      "label": "AI TOOLS",
      "widget": const ToolsPage(),
    },
    {
      "label": "AI NEWS",
      "widget": const NewsPage(),
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          pages[activeindex]["label"],
          style: const TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: pages[activeindex]["widget"],
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.store),
              label: "TOOLS",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.campaign),
              label: "NEWS",
            ),
          ],
          backgroundColor: Colors.grey[900],
          unselectedItemColor: Colors.white,
          currentIndex: activeindex,
          onTap: (value) => {
            setState(() {
              activeindex = value;
            })
          },
        ),
      ),
    );
  }
}
