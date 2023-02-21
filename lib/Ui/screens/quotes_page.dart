import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:swipe_deck/swipe_deck.dart';

import '../utilities/mediaQuery.dart';
import '../utilities/quotes.dart';

class QuotePage extends StatefulWidget {
  const QuotePage({Key? key}) : super(key: key);

  @override
  State<QuotePage> createState() => _QuotePageState();
}

String stringRep = "";

class _QuotePageState extends State<QuotePage> {
  bool animate = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      animate = false;
    });

    Timer(
        const Duration(milliseconds: 600),
        () => setState(() {
              animate = true;
            }));
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    Mediaquery media =
        Mediaquery(mediaHeight: deviceHeight, mediaWidth: deviceWidth);

    return Column(
      children: [
        SizedBox(
          height: media.getHeight(20),
        ),
        Expanded(
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 1300),
            opacity: animate ? 1 : 0,
            curve: Curves.easeOutSine,
            child: Text(
              "Discover the wisdom of the ages with these timeless quotes",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: media.getwidht(22),
                fontFamily: 'Courgette',
              ),
            ),
          ),
        ),
        SizedBox(
          height: media.getHeight(10),
        ),
        Expanded(
          flex: 5,
          child: Container(
            child: SwipeDeck(
              cardSpreadInDegrees: 10,
              startIndex: Random().nextInt(100),
              aspectRatio: 1.3,
              widgets: quotes
                  .map((e) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF1e0059),
                              Color(0xFf3b246a),
                              Color(0xFF926b9f),
                            ],
                            end: Alignment.bottomCenter,
                            begin: Alignment.topCenter,
                            stops: [0, 0.7, 1],
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(media.getwidht(12)),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Center(
                                  child: Text(
                                    e["author"].toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Courgette',
                                        fontWeight: FontWeight.w900,
                                        fontSize: media.getwidht(18)),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Center(
                                  child: Text(
                                    e["quote"].toString(),
                                    style: TextStyle(
                                        color: Colors.white70,
                                        fontWeight: FontWeight.w100,
                                        fontFamily: 'Courgette',
                                        fontSize: media.getwidht(18)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
