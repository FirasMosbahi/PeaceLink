import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:rive_splash_screen/rive_splash_screen.dart';

import 'second_splachScreen.dart';

class FirstSplach extends StatelessWidget {
  const FirstSplach({Key? key}) : super(key: key);

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
              next: (context) => const SecondSplach(),
              until: () => Future.delayed(
                const Duration(milliseconds: 4500),
              ),
              loopAnimation: "Beginner",
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
                  "Welcome to our app",
                  speed: const Duration(milliseconds: 50),
                  textStyle: const TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.none,
                      fontSize: 22),
                  textAlign: TextAlign.center,
                ),
                TypewriterAnimatedText(
                  "Have a grateful experience",
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
