import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:rive_splash_screen/rive_splash_screen.dart';

import 'log_in_screen.dart';

class ThirdSplach extends StatelessWidget {
  const ThirdSplach({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                const Duration(seconds: 5),
              ),
              loopAnimation: "Expert",
              backgroundColor: const Color(0xFF390A3B),
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
                  "You can chat with specialist ",
                  speed: const Duration(milliseconds: 50),
                  textStyle: const TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.none,
                      fontSize: 22),
                  textAlign: TextAlign.center,
                ),
                TypewriterAnimatedText(
                  "You can join anonymous chat",
                  speed: const Duration(milliseconds: 50),
                  textStyle: const TextStyle(
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
    ));
  }
}
