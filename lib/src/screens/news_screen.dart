import 'package:aihunt/controller/ad_controller.dart';
import 'package:aihunt/function.dart';
import 'package:aihunt/shimmer/news_shimmer.dart';
import 'package:aihunt/src/constant.dart';
import 'package:aihunt/src/helpers/native_ad.dart';
import 'package:aihunt/type/news.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:aihunt/src/services/api_services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  List<AiNewsType> news = [];
  int page = 0;
  bool loading = true;

  loadData() async {
    var response = await dio.get(
      "${Constants.apiUrl}=news&start=${page * 10}&limit=${10}",
    );
    if (response.statusCode == 200) {
      for (var item in response.data["data"]) {
        news.add(AiNewsType.fromJson(item));
        if (response.data["data"].length == 10) {
          page++;
        } else {
          loading = false;
        }
        if (mounted) {
          setState(() {});
        }
      }
    }
  }

  @override
  void initState() {
    loadData();
    BannerAd(
      adUnitId: AdHelper.bannerAds,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            bannerAd = ad as BannerAd;
          });
        },
        onAdFailedToLoad: (ad, err) {
          ad.dispose();
        },
      ),
    ).load();
    super.initState();
  }

  BannerAd? bannerAd;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Column(
        children: [
          if (bannerAd != null)
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: bannerAd!.size.width.toDouble(),
                height: bannerAd!.size.height.toDouble(),
                child: AdWidget(ad: bannerAd!),
              ),
            ),
          Expanded(
            child: LazyLoadScrollView(
              onEndOfPage: () => loadData(),
              child: ListView(
                children: [
                  for (var idx = 0; idx < news.length; idx++) ...[
                    SizedBox(
                      child: Card(
                        elevation: 3,
                        shadowColor: Colors.black,
                        margin: const EdgeInsets.all(16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            launchUrl(
                              Uri.parse(news[idx].id),
                              mode: LaunchMode.externalNonBrowserApplication,
                            );
                          },
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(9.0),
                                child: CachedNetworkImage(
                                  imageUrl: Uri.parse(
                                    'https://www.aitoolhunt.com/_next/image',
                                  ).replace(
                                    queryParameters: {
                                      'url': news[idx].thumbnail,
                                      'q': '85',
                                      'w': '1080',
                                    },
                                  ).toString(),
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Center(
                                    child: SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: Image.asset(
                                        "assets/logo-nobg.png",
                                        fit: BoxFit.contain,
                                        color: Colors.black.withOpacity(0.4),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 8, 16, 4),
                                child: Text(
                                  news[idx].metadata.title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(fontSize: 20),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 2, 16, 18),
                                child: Text(
                                  news[idx].metadata.description,
                                  style: const TextStyle(
                                    fontSize: 16,
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
                                      backgroundColor: Colors.grey.shade200,
                                      backgroundImage:
                                          CachedNetworkImageProvider(
                                        Uri.parse(
                                          'http://api.frontendforever.com/ai/image.php',
                                        ).replace(
                                          queryParameters: {
                                            'url': news[idx].icon,
                                            'q': '32',
                                            'w': '32',
                                          },
                                        ).toString(),
                                      ),
                                    ),
                                    Text(
                                      convertEpochtoTimeAgo(
                                        news[idx].datetime,
                                      ),
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // const Padding(padding: EdgeInsets.all(16))
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (idx % 5 == 0 && idx != 0) ...[
                      const SizedBox(height: 10),
                      const AdMobNative(),
                      const SizedBox(height: 10),
                    ],
                  ],
                  if (loading) ...[
                    const NewsShimmer(),
                    const NewsShimmer(),
                  ]
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
