import 'package:chat_for_peace/Ui/screens/cardPaiement.dart';
import 'package:chat_for_peace/core/models/donation_model.dart';
import 'package:flutter/material.dart';

class CardRe extends StatelessWidget {
  final img;
  final text;
  final price;
  const CardRe(
      {super.key, required this.img, required this.text, required this.price});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 6,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
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
                    stops: [0.6, 1]),
              ),
              child: Column(
                children: [
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      text,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Courgette',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CardPaiement(
                            amount: price,
                            donation: Donation(
                                currentValue: 0,
                                finalValue: 0,
                                description: "",
                                category: ""),
                          )));
            },
            child: Container(
              height: 50,
              width: 120,
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
                    const SizedBox(
                      width: 145,
                    ),
                    const Text(
                      "Donate",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Text(
                      price,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.grey[800],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 25,
        )
      ],
    );
  }
}
