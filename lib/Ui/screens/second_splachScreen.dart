import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:rive_splash_screen/rive_splash_screen.dart';

import 'third_splach_screen.dart';

class SecondSplach extends StatelessWidget {
  const SecondSplach({Key? key}) : super(key: key);

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
              next: (context) => const ThirdSplach(),
              until: () => Future.delayed(
                const Duration(seconds: 5),
              ),
              loopAnimation: "Intermediate",
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
                  " You can make donations",
                  speed: const Duration(milliseconds: 50),
                  textStyle: const TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.none,
                      fontSize: 22),
                  textAlign: TextAlign.center,
                ),
                TypewriterAnimatedText(
                  "You can shares your ideas",
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
