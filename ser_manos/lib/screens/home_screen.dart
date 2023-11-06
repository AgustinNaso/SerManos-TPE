import 'package:flutter/material.dart';
import 'package:ser_manos/config/cellules/information_card.dart';
import 'package:ser_manos/config/tokens/sermanos_colors.dart';
import 'package:ser_manos/screens/news_screen.dart';
import 'package:ser_manos/screens/postulate/postulate_screen.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:ser_manos/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Image(
              image: AssetImage('assets/images/logo-rec.png'),
            ),
            backgroundColor: SermanosColors.secondary90,
          ),
          body: Column(children: [
            Container(
                color: SermanosColors.secondary100,
                height: 52,
                child: TabBar(
                    indicatorColor: SermanosColors.neutral0,
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: SermanosColors.neutral0,
                    unselectedLabelColor: SermanosColors.neutral25,
                    indicator: const BoxDecoration(
                        color: SermanosColors.secondary200,
                        border: Border(
                          bottom: BorderSide(color: Colors.white, width: 3),
                        )),
                    tabs: <Widget>[
                      Tab(text: AppLocalizations.of(context)!.postulateAppBar),
                      Tab(text: AppLocalizations.of(context)!.profileAppBar),
                      Tab(text: AppLocalizations.of(context)!.newsAppBar),
                    ])),
            const Expanded(
                child: TabBarView(
              children: [PostulateScreen(), ProfileScreen(), NewsScreen()],
            ))
          ]),
        ));
  }
}
