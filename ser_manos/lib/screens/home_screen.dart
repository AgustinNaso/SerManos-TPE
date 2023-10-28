import 'package:flutter/material.dart';
import 'package:ser_manos/config/tokens/sermanos_colors.dart';
import 'package:ser_manos/screens/news_screen.dart';
import 'package:ser_manos/screens/postulate_screen.dart';

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
            backgroundColor: SermanosColors.secondary[1],
          ),
          body: Column(children: [
            Container(
                color: SermanosColors.secondary[1],
                child: const TabBar(
                    indicatorColor: Colors.white,
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.white,
                    indicator: BoxDecoration(
                        color: SermanosColors.secondary,
                        border: Border(
                          bottom: BorderSide(color: Colors.white, width: 3),
                        )),
                    tabs: <Widget>[
                      Tab(text: 'Postulate'),
                      Tab(text: 'Mi Perfil'),
                      Tab(text: 'Novedades'),
                    ])),
            const Expanded(
                child: TabBarView(
              children: [PostulateScreen(), Text("hola2"), NewsScreen()],
            ))
          ]),
        ));
  }
}
