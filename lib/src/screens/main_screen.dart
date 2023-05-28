import 'package:aihunt/controller/ad_controller.dart';
import 'package:aihunt/src/helpers/drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:in_app_review/in_app_review.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:aihunt/function.dart';
import 'package:aihunt/src/constant.dart';
import 'package:aihunt/src/screens/news_screen.dart';
import 'package:aihunt/src/screens/tools_screen.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int activeindex = 0;
  final pageController = PageController();
  AppOpenAd? _appOpenAd;

  final InAppReview inAppReview = InAppReview.instance;
  init() async {
    getAndroidRegId();
    InAppUpdate.checkForUpdate().then((value) {
      if (value.updateAvailability == UpdateAvailability.updateAvailable) {
        InAppUpdate.startFlexibleUpdate();
      }
    });
    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
    }
    AppOpenAd.load(
      adUnitId: AdHelper.appOpenAds,
      orientation: AppOpenAd.orientationPortrait,
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              _appOpenAd = null;
            },
          );
          _appOpenAd = ad;
          _appOpenAd!.show();
        },
        onAdFailedToLoad: (error) {
          print('AppOpenAd failed to load: $error');
          // Handle the error.
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          activeindex == 0 ? "AI TOOLS" : "AI NEWS",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: const RootDrawer(),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: const [
          ToolsPage(),
          NewsPage(),
        ],
        onPageChanged: (value) => {
          setState(() {
            activeindex = value;
          })
        },
      ),
      bottomNavigationBar: SizedBox(
        height: 70,
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
          backgroundColor: Constants.primaryColor,
          unselectedItemColor: Colors.white.withOpacity(0.5),
          selectedItemColor: Colors.white,
          currentIndex: activeindex,
          onTap: (value) => {
            pageController.animateToPage(
              value,
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease,
            ),
            setState(() {
              activeindex = value;
            })
          },
        ),
      ),
    );
  }
}
