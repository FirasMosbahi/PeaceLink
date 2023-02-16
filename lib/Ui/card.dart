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
          child: TextButton(
            onPressed: () {},
            child: Row(
              children: [
                SizedBox(
                  width: 133,
                ),
                Text(
                  "Donate",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Spacer(),
                Text(
                  this.price,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              backgroundColor: Color(0xFFEFD54C),
              primary: Colors.black,
              fixedSize: Size(149, 22),
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
