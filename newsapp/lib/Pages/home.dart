// ignore: avoid_web_libraries_in_flutter
// ignore_for_file: unused_import

import 'package:flutter/foundation.dart' as foundation;
// ignore: library_prefixes
import 'dart:io' as IoPlatform;
// ignore: avoid_web_libraries_in_flutter, library_prefixes
import 'dart:html' as HtmlPlatform;
import 'package:flutter/material.dart';
import 'package:newsapp/blocs/znews.dart';
import 'package:newsapp/blocs/newsstates.dart';
import 'package:newsapp/blocs/newsevents.dart';
import 'package:newsapp/structure/articlestructure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
// ignore: depend_on_referenced_packages
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:ui_web' as ui_web;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<ZNews>().add(StartEvent());
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  margin: EdgeInsets.only(left: width * 0.01),
                  child: Text(
                    "News App".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.6,
                ),
                Container(
                  height: 1,
                  color: Colors.grey.withOpacity(0.7),
                  width: width,
                  margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                ),
              ],
            ),
            Container(
              color: Colors.white,
              margin: EdgeInsets.only(top: height * 0.08),
              child: BlocBuilder<ZNews, NewsStates>(
                builder: (BuildContext context, NewsStates state) {
                  if (state is NewsLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is NewsLoadedState) {
                    List<ArticleModel> articleList = state.articleList;
                    return ListView.builder(
                      itemCount: articleList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () async {
                            if (IoPlatform.Platform.isAndroid) {
                              FlutterWebBrowser.openWebPage(
                                url: articleList[index].url,
                                customTabsOptions: const CustomTabsOptions(
                                  shareState: CustomTabsShareState.on,
                                  instantAppsEnabled: true,
                                  showTitle: true,
                                  urlBarHidingEnabled: true,
                                ),
                              );
                            } else if (IoPlatform.Platform.isIOS) {
                              FlutterWebBrowser.openWebPage(
                                url: articleList[index].url,
                                safariVCOptions:
                                    const SafariViewControllerOptions(
                                  barCollapsingEnabled: true,
                                  preferredBarTintColor: Colors.green,
                                  preferredControlTintColor: Colors.amber,
                                  dismissButtonStyle:
                                      SafariViewControllerDismissButtonStyle
                                          .close,
                                  modalPresentationCapturesStatusBarAppearance:
                                      true,
                                ),
                              );
                            } else if (foundation.kIsWeb) {
                              try {
                                // ignore: await_only_futures
                                await HtmlPlatform.window.open(
                                  articleList[index].url,
                                  '_blank',
                                );
                              } catch (e) {
                                // ignore: avoid_print
                                print('Failed to open URL: $e');
                              }
                            } else {
                              await FlutterWebBrowser.openWebPage(
                                url: articleList[index].url,
                              );
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 1,
                                  color: Colors.grey,
                                  offset: Offset(0, 2),
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                            height: height * 0.15,
                            margin: EdgeInsets.only(
                              bottom: height * 0.01,
                              top: height * 0.01,
                              left: width * 0.02,
                              right: width * 0.02,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: width * 0.3,
                                  height: height * 0.15,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                    ),
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: articleList[index].urlToImage,
                                    placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Center(
                                      child: Icon(Icons.error),
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.03,
                                ),
                                Container(
                                  height: height * 0.15,
                                  width: width * 0.55,
                                  padding: EdgeInsets.symmetric(
                                    vertical: height * 0.01,
                                  ),
                                  child: Text(
                                    articleList[index].title,
                                    overflow: TextOverflow.clip,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else if (state is NewsErrorState) {
                    String error = state.errorMessage;
                    return Center(child: Text(error));
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.green,
                      ),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
