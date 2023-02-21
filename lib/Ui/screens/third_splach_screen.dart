import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:rive_splash_screen/rive_splash_screen.dart';

import '../utilities/mediaQuery.dart';
import 'log_in_screen.dart';

class ThirdSplach extends StatelessWidget {
  const ThirdSplach({Key? key}) : super(key: key);

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
              next: (context) => const LogIn(),
              until: () => Future.delayed(
                const Duration(milliseconds: 5400),
              ),
              loopAnimation: "Expert",
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
                  "You can not only chat with specialist ",
                  speed: const Duration(milliseconds: 50),
                  textStyle: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.none,
                      fontSize: media.getwidht(22)),
                  textAlign: TextAlign.center,
                ),
                TypewriterAnimatedText(
                  "but also join anonymous chat",
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
