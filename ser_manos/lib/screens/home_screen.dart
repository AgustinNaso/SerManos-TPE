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
            title: const Text('Ser Manos'),
            backgroundColor: SermanosColors.secondary[1],
          ),
          body: const Column(children: [
            TabBar(
                indicatorColor: Colors.white,
                labelColor: Colors.white,
                tabs: [
                  Tab(text: 'Postularse'),
                  Tab(text: 'Mi Perfil'),
                  Tab(text: 'Novedades'),
                ]),
            Expanded(
                child: TabBarView(
              children: [PostulateScreen(), Text("hola2"), NewsScreen()],
            ))
          ]),
        ));
  }
}
