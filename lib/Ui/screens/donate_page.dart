import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';

import '../utilities/mediaQuery.dart';
import '../widgets/card_widget.dart';

class DonatePage extends StatelessWidget {
  const DonatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    Mediaquery media =
        Mediaquery(mediaHeight: deviceHeight, mediaWidth: deviceWidth);

    const Images = [
      [
        "image1.jpg",
        "Your food donation can provide nourishment and hope to those in need.",
        "10£"
      ],
      [
        "image2.jpg",
        "Your healthcare donation can make a difference and help improve the health and quality of life for people in need.",
        "50£"
      ],
      [
        "image3.jpeg",
        "Your education donation can make a difference in a child's life, provide opportunities, and help build a brighter future for generations to come.",
        "20£"
      ],
      [
        "image4.png",
        "Empower young people and make a difference in their lives with your donation to youth development programs",
        "20£"
      ],
      [
        "image5.jpg",
        "Give hope to the homeless and support those in need with your shelter donation.",
        "40£"
      ],
    ];
    return Column(
      children: [
        SizedBox(
          height: media.getHeight(20),
        ),
        AnimatedTextKit(
          animatedTexts: [
            TyperAnimatedText(
              "Our Packs , please select one to donate",
              speed: const Duration(milliseconds: 100),
              textStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: media.getwidht(22),
                fontFamily: 'Courgette',
              ),
            ),
          ],
        ),
        SizedBox(
          height: media.getHeight(10),
        ),
        Center(
          child: Container(
            width: media.getwidht(350),
            height: media.getHeight(630),
            child: CarouselSlider(
              slideTransform: const CubeTransform(),
              unlimitedMode: true,
              slideIndicator: CircularSlideIndicator(),
              children: Images.map(
                (e) => Container(
                  child: CardRe(
                    img: e[0],
                    text: e[1],
                    price: e[2],
                  ),
                ),
              ).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
