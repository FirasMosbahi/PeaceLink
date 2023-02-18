import 'dart:math';

import 'package:flutter/material.dart';
import 'package:swipe_deck/swipe_deck.dart';

import 'quotes.dart';

class quotePage extends StatefulWidget {
  const quotePage({Key? key}) : super(key: key);

  @override
  State<quotePage> createState() => _quotePageState();
}

String stringRep = "";

class _quotePageState extends State<quotePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: Text(
            "Discover the wisdom of the ages with these timeless quotes",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
              fontFamily: 'Courgette',
            ),
          ),
        ),
        SizedBox(
          height: 10,
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
                          gradient: LinearGradient(
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
                          padding: const EdgeInsets.all(12.0),
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
                                        fontSize: 18),
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
                                        fontSize: 18),
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
