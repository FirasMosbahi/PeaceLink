import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

AppBar appBar = AppBar(
  backgroundColor: Color(0xFF1f005c),
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
            padding: const EdgeInsets.only(left: 5, top: 15),
            child: CircleAvatar(
              radius: 30.0,
              backgroundImage: AssetImage(
                "assets/formation-android.jpg",
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Center(
            child: AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  "Hello amine , Welcome 😊",
                  speed: Duration(milliseconds: 130),
                  textStyle: TextStyle(fontSize: 18, color: Colors.white70),
                ),
              ],
            ),
          ),
        ),
        Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(right: 5, top: 17),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  FontAwesomeIcons.comments,
                  size: 35,
                  color: Colors.purple,
                ),
              ),
            ))
      ],
    ),
  ),
);
