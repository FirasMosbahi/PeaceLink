import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:rive_splash_screen/rive_splash_screen.dart';

import '../utilities/mediaQuery.dart';
import 'second_splachScreen.dart';

class FirstSplach extends StatelessWidget {
  const FirstSplach({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    Mediaquery media =
        Mediaquery(mediaHeight: deviceHeight, mediaWidth: deviceWidth);

    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Positioned.fill(
            child: SplashScreen.navigate(
              fit: BoxFit.fill,
              name: 'assets/mixing_animations.riv',
              next: (context) => const SecondSplach(),
              until: () => Future.delayed(
                const Duration(milliseconds: 4350),
              ),
              loopAnimation: "Beginner",
              backgroundColor: const Color(0xFF390A3B),
            ),
          ),
          Positioned(
            bottom: media.getHeight(50),
            left: media.getwidht(10),
            height: media.getHeight(120),
            width: media.getwidht(400),
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  "Welcome to our app",
                  speed: const Duration(milliseconds: 50),
                  textStyle: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.none,
                      fontSize: media.getwidht(22)),
                  textAlign: TextAlign.center,
                ),
                TypewriterAnimatedText(
                  "Have a grateful experience",
                  speed: const Duration(milliseconds: 50),
                  textStyle: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.none,
                      fontSize: media.getwidht(22)),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
