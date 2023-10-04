import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ser_manos/config/celulles/volunteering_card.dart';

import '../config/celulles/news_card.dart';
import '../config/tokens/sermanos_colors.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const <Widget>[
            Center(
                child: NewsCard(),
              ),
          
          ],
        )
      ),
    );
  }
}
