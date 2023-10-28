import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        child: const Column(
          children: <Widget>[
            Center(
              child: Text('Home Screen'),
            ),
          ],
        ),
      )),
    );
  }
}
