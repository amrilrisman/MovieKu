import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:home/presentation/content/content_app_bar.dart';
import 'package:home/presentation/content/content_category.dart';
import 'package:home/presentation/content/content_other.dart';
import 'package:home/presentation/content/content_popular.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            const ContentAppBar(),
          ];
        },
        body: ListView(
          children: const [
            ContentCategory(),
            ContentPopular(),
            ContentPopularMovie()
          ],
        ),
      ),
    );
  }
}
