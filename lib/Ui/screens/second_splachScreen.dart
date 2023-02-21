import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:rive_splash_screen/rive_splash_screen.dart';

import '../utilities/mediaQuery.dart';
import 'log_in_screen.dart';
import 'third_splach_screen.dart';

class SecondSplach extends StatelessWidget {
  const SecondSplach({Key? key}) : super(key: key);

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
              next: (context) => const ThirdSplach(),
              until: () => Future.delayed(
                const Duration(milliseconds: 4000),
              ),
              loopAnimation: "Intermediate",
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
                  " You can make donations",
                  speed: const Duration(milliseconds: 45),
                  textStyle: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.none,
                      fontSize: media.getwidht(22)),
                  textAlign: TextAlign.center,
                ),
                TypewriterAnimatedText(
                  "and shares your ideas",
                  speed: const Duration(milliseconds: 45),
                  textStyle: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.none,
                      fontSize: media.getwidht(22)),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: deviceHeight * 0.05,
            right: deviceWidth * 0.1,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => LogIn()));
              },
              child: Text(
                "skip",
                style: TextStyle(
                  fontSize: deviceWidth * 0.05,
                  color: Color.fromRGBO(143, 148, 251, 1),
                  fontFamily: 'Courgette',
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
