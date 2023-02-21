import 'package:PeaceLink/Ui/screens/shared_page.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

import '../utilities/mediaQuery.dart';
import 'chat_Page.dart';
import 'donate_page.dart';
import 'home_screen.dart';
import 'quotes_page.dart';
import 'user_page.dart';

class MyApp extends StatefulWidget {
  int index;
  MyApp({required this.index});
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
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    Mediaquery media =
        Mediaquery(mediaHeight: deviceHeight, mediaWidth: deviceWidth);
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
        appBar: AppBar(
          backgroundColor: const Color(0xFF1f005c),
          elevation: 0,
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.ideographic,
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                      padding: EdgeInsets.only(
                          left: media.getwidht(5), top: media.getHeight(15)),
                      child: ClipOval(
                        child: Image.asset(
                          "assets/logo.png",
                          fit: BoxFit.contain,
                          height: media.getHeight(65),
                          width: media.getwidht(15),
                        ),
                      )),
                ),
                Expanded(
                  flex: 3,
                  child: Center(
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText(
                          "Hello , Welcome 😊",
                          speed: const Duration(milliseconds: 130),
                          textStyle: TextStyle(
                              fontSize: media.getwidht(18),
                              color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(
                          right: media.getwidht(5), top: media.getHeight(17)),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChatPage()));
                        },
                        child: Icon(
                          FontAwesomeIcons.comments,
                          size: media.getwidht(35),
                          color: Colors.purple,
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
        body: screens[widget.index],
        bottomNavigationBar: Theme(
          data: Theme.of(context)
              .copyWith(iconTheme: const IconThemeData(color: Colors.purple)),
          child: CurvedNavigationBar(
            key: navigationKey,
            items: items,
            height: media.getHeight(60),
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
