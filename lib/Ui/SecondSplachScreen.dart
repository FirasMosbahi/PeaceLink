import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:rive_splash_screen/rive_splash_screen.dart';

import 'ThirdSplachScreen.dart';

class secondSplach extends StatelessWidget {
  const secondSplach({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Stack(
            children: [
              Positioned.fill(
                child: SplashScreen.navigate(
                  fit: BoxFit.fill,
                  name: 'assets/mixing_animations.riv',
                  next: (context) => thirdSplach(),
                  until: () => Future.delayed(
                    Duration(seconds: 5),
                  ),
                  loopAnimation: "Intermediate",
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
        ));
  }
}
