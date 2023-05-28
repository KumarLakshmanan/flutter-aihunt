import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class RootDrawer extends StatelessWidget {
  const RootDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    "assets/logo-nobg.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            accountName: const Text(
              "AI Hunt",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: const Text(
              "com.ai.tools.news",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
          ListTile(
            leading: Container(
              height: 20,
              width: 20,
              alignment: Alignment.center,
              child: Image.asset(
                'assets/heart.png',
                height: 20,
                width: 20,
                color: Colors.black,
              ),
            ),
            onTap: () {},
            title: const Text(
              "Donate Us",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.add_to_photos_sharp,
              color: Colors.black,
            ),
            onTap: () async {
              await launchUrl(
                Uri.parse(
                  "https://play.google.com/store/apps/developer?id=Lakshmanan+Kumar",
                ),
                mode: LaunchMode.externalApplication,
              );
            },
            title: const Text(
              "More Apps",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.share,
              color: Colors.black,
            ),
            onTap: () async {
              Share.share(
                "Check out this awesome app.\n\n AI Hunt - The Ultimate Directory for Discovering the Best AI Tools.\n\nIt's a free app that helps you to learn more about AI.\n\nDownload it now from https://play.google.com/store/apps/details?id=com.ai.tools.news",
              );
            },
            title: const Text(
              "App Share",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.star,
              color: Colors.black,
            ),
            onTap: () {
              launchUrl(
                Uri.parse(
                  "https://play.google.com/store/apps/details?id=com.ai.tools.news",
                ),
                mode: LaunchMode.externalApplication,
              );
            },
            title: const Text(
              "Rate Us",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.lock,
              color: Colors.black,
            ),
            onTap: () {
              launchUrl(
                Uri.parse(
                  "https://frontendforever.com/aitoolhunt.html",
                ),
                mode: LaunchMode.inAppWebView,
              );
            },
            title: const Text(
              "Privacy policy",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
