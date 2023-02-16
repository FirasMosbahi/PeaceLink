import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rive_splash_screen/rive_splash_screen.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

import 'DonatePage.dart';
import 'HomeScreen.dart';
import 'QuotesPage.dart';
import 'SecondSplachScreen.dart';
import 'SharedPage.dart';
import 'UserPage.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: SplashScreen.navigate(
                fit: BoxFit.fill,
                name: 'assets/mixing_animations.riv',
                next: (context) => secondSplach(),
                until: () => Future.delayed(
                  Duration(seconds: 4),
                ),
                loopAnimation: "Beginner",
                backgroundColor: Color(0xFF390A3B),
              ),
            ),
            Positioned(
              bottom: 50,
              left: 10,
              height: 120,
              width: 400,
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    "Welcome to our app",
                    speed: Duration(milliseconds: 50),
                    textStyle: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontSize: 22),
                    textAlign: TextAlign.center,
                  ),
                  TypewriterAnimatedText(
                    "aaaaaa",
                    speed: Duration(milliseconds: 50),
                    textStyle: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontSize: 22),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      )));
}

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
    return ScaffoldGradientBackground(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF28022C),
            Color(0xB328022C),
            Color(0xFF944545),
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
    );
    ;
  }
}
