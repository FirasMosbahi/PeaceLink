import 'package:flutter/material.dart';

class Card_Re extends StatelessWidget {
  final img;
  final text;
  final price;
  Card_Re(this.img, this.text, this.price) {}
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 6,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/" + this.img),
                )),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.6, 1]),
              ),
              child: Column(
                children: [
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      this.text,
                      style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Courgette',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(
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
            onTap: () {},
            child: Container(
              height: 50,
              width: 120,
              decoration: BoxDecoration(
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
                      width: 145,
                    ),
                    Text(
                      "Donate",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      this.price,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.grey[800],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 25,
        )
      ],
    );
  }
}
