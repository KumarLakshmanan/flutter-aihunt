import 'package:aihunt/function.dart';
import 'package:aihunt/shimmer/news_shimmer.dart';
import 'package:aihunt/src/constant.dart';
import 'package:aihunt/src/helpers/filter_by.dart';
import 'package:aihunt/src/helpers/native_ad.dart';
import 'package:aihunt/src/helpers/search.dart';
import 'package:aihunt/type/tool.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:aihunt/src/services/api_services.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:url_launcher/url_launcher.dart';

class ToolsPage extends StatefulWidget {
  const ToolsPage({super.key});

  @override
  State<ToolsPage> createState() => _ToolsPageState();
}

class _ToolsPageState extends State<ToolsPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  List<AiToolType> tools = [];
  int page = 0;
  bool loading = true;
  String search = "";
  String categories = "";
  final controller = TextEditingController();
  final searchFocusNode = FocusNode();

  loadData() async {
    var response = await dio.get(
      "${Constants.apiUrl}=fetch&start=${tools.length}&limit=${10}&search=$search&category=$categories",
    );
    print(
        "${Constants.apiUrl}=fetch&start=${tools.length}&limit=${10}&search=$search&category=$categories");
    if (response.statusCode == 200) {
      for (var item in response.data["data"]) {
        tools.add(AiToolType.fromJson(item));
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Constants.primaryColor,
            child: SearchBox(
              controller: controller,
              searchFocusNode: searchFocusNode,
              onChanged: (_) {
                search = _;
                page = 0;
                tools = [];
                loading = true;
                setState(() {});
                loadData();
              },
            ),
          ),
          const SizedBox(height: 5),
          FilterBy(
            onChanged: (_) {
              categories = _;
              page = 0;
              tools = [];
              loading = true;
              setState(() {});
              loadData();
            },
          ),
          const SizedBox(height: 5),
          Expanded(
            child: LazyLoadScrollView(
              onEndOfPage: () => loadData(),
              child: ListView(
                children: [
                  for (var idx = 0; idx < tools.length; idx++) ...[
                    SizedBox(
                      child: GestureDetector(
                        onTap: () {
                          launchUrl(
                            Uri.parse("https://${tools[idx].id}"),
                            mode: LaunchMode.externalNonBrowserApplication,
                          );
                        },
                        child: Card(
                          elevation: 3,
                          shadowColor: Colors.black,
                          margin: const EdgeInsets.all(16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(9.0),
                                child: CachedNetworkImage(
                                  imageUrl: Uri.parse(
                                    'http://api.frontendforever.com/ai/image.php',
                                  ).replace(
                                    queryParameters: {
                                      'url':
                                          "/thumbnails/${replaceStringForThumb(tools[idx].id)}.png",
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
                                    const EdgeInsets.fromLTRB(16, 4, 16, 0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        tools[idx].title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(fontSize: 20),
                                      ),
                                    ),
                                    const Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                      size: 20,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      tools[idx].favouriteCount.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 4, 16, 0),
                                child: Text(
                                  tools[idx].gpt33.heading,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 4, 16, 0),
                                child: Wrap(
                                  runAlignment: WrapAlignment.start,
                                  spacing: 5,
                                  children: [
                                    for (int idc = 0;
                                        idc < tools[idx].category.length;
                                        idc++)
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 2,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Constants.primaryColor,
                                        ),
                                        child: Text(
                                          tools[idx].category[idc],
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
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
