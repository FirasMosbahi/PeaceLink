import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

import 'DonatePage.dart';
import 'HomeScreen.dart';
import 'QuotesPage.dart';
import 'SharedPage.dart';
import 'UserPage.dart';

class MyApp extends StatefulWidget {
  int index;
  AppBar appBar;
  MyApp(this.index, this.appBar) {}
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  final screens = [
    dontePage(),
    sharedPage(),
    Home(),
    quotePage(),
    userPage(),
  ];
  final List<Widget> items = [
    Icon(
      FontAwesomeIcons.donate,
      size: 30,
    ),
    Icon(
      Icons.lightbulb,
      size: 30,
    ),
    Icon(
      Icons.home,
      size: 30,
    ),
    Icon(
      Icons.favorite,
      size: 30,
    ),
    Icon(
      Icons.person,
      size: 30,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScaffoldGradientBackground(
        gradient: LinearGradient(
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
              .copyWith(iconTheme: IconThemeData(color: Colors.purple)),
          child: CurvedNavigationBar(
            key: navigationKey,
            items: items,
            height: 60,
            buttonBackgroundColor: Colors.white,
            index: widget.index,
            backgroundColor: Color(0x00944545),
            onTap: (index) => setState(() {
              widget.index = index;
            }),
            animationDuration: Duration(milliseconds: 500),
          ),
        ),
      ),
    );
  }
}
