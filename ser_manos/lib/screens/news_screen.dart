import 'package:flutter/material.dart';

// import '../config/celulles/news_card.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Center(
                // child: NewsCard(),
              ),
          
          ],
        )
      ),
    );
  }
}
