import 'package:PeaceLink/Ui/screens/card_payement.dart';
import 'package:PeaceLink/core/models/donation_model.dart';
import 'package:flutter/material.dart';

import 'package:PeaceLink/Ui/utilities/mediaQuery.dart';

class CardRe extends StatelessWidget {
  final String img;
  final String text;
  final String price;
  const CardRe(
      {super.key, required this.img, required this.text, required this.price});
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    Mediaquery media =
        Mediaquery(mediaHeight: deviceHeight, mediaWidth: deviceWidth);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 6,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/$img"),
                )),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.6, 1],
                ),
              ),
              child: Column(
                children: [
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.only(
                      left: media.getwidht(10),
                    ),
                    child: Text(
                      text,
                      style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Courgette',
                        fontSize: media.getwidht(16),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: media.getHeight(10),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => CardPayment(
                    amount: price,
                    donation: Donation(
                        currentValue: 0,
                        finalValue: 0,
                        description: "",
                        category: ""),
                  ),
                ),
              );
            },
            child: Container(
              height: media.getHeight(50),
              width: media.getwidht(120),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(143, 148, 251, 0.4),
                    Color.fromRGBO(143, 148, 251, 1),
                    Color.fromRGBO(143, 148, 251, 1),
                    Color.fromRGBO(143, 148, 251, 0.4),
                  ],
                ),
              ),
              child: Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: media.getwidht(145),
                    ),
                    Text(
                      "Donate",
                      style: TextStyle(
                        fontSize: media.getwidht(18),
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      price,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: media.getwidht(25),
                        color: Colors.grey[800],
                      ),
                    ),
                    SizedBox(
                      width: media.getwidht(10),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: media.getwidht(25),
        ),
      ],
    );
  }
}
