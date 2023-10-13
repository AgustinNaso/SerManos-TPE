import 'package:flutter/material.dart';

// import '../config/celulles/news_card.dart';
import '../config/cellules/news_card/news_card.dart';
import '../config/tokens/sermanos_colors.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: const <Widget>[
            Center(
              child: NewsCard(),
            ),
          ],
        ),
      )),
    );
  }
}
