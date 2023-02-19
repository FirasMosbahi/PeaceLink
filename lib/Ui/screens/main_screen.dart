import 'package:chat_for_peace/Ui/screens/shared_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

import 'donate_page.dart';
import 'home_screen.dart';
import 'quotes_page.dart';
import 'user_page.dart';

class MyApp extends StatefulWidget {
  int index;
  AppBar appBar;
  MyApp({required this.index, required this.appBar});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  final screens = [
    const DontePage(),
    const SharedPage(),
    const Home(),
    const QuotePage(),
    const UserPage(),
  ];
  final List<Widget> items = [
    const Icon(
      FontAwesomeIcons.donate,
      size: 30,
    ),
    const Icon(
      Icons.lightbulb,
      size: 30,
    ),
    const Icon(
      Icons.home,
      size: 30,
    ),
    const Icon(
      Icons.favorite,
      size: 30,
    ),
    const Icon(
      Icons.person,
      size: 30,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScaffoldGradientBackground(
        gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1e0059),
              Color(0xFF49125c),
              Color(0xFf3b246a),
              Color(0xFF926b9f),
            ],
            stops: [
              0,
              0.48,
              0.7,
              1
            ]),
        appBar: widget.appBar,
        body: screens[widget.index],
        bottomNavigationBar: Theme(
          data: Theme.of(context)
              .copyWith(iconTheme: const IconThemeData(color: Colors.purple)),
          child: CurvedNavigationBar(
            key: navigationKey,
            items: items,
            height: 60,
            buttonBackgroundColor: Colors.white,
            index: widget.index,
            backgroundColor: const Color(0x00944545),
            onTap: (index) => setState(() {
              widget.index = index;
            }),
            animationDuration: const Duration(milliseconds: 500),
          ),
        ),
      ),
    );
  }
}
