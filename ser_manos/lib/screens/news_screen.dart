import 'package:flutter/material.dart';

import '../config/cellules/news_card/news_card.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        child: const Column(
          children: <Widget>[
            Center(
              child: NewsCard(),
            ),
          ],
        ),
      )),
    );
  }
}
