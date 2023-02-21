import 'package:flutter/material.dart';

import '../utilities/mediaQuery.dart';

class Field extends StatelessWidget {
  final void Function() onClick;
  const Field({Key? key, required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    Mediaquery media =
        Mediaquery(mediaHeight: deviceHeight, mediaWidth: deviceWidth);
    return GestureDetector(
      onTap: onClick,
      child: Container(
        height: media.getHeight(40),
        width: media.getwidht(60),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            colors: [
              Color.fromRGBO(143, 148, 251, 0.4),
              Color.fromRGBO(143, 148, 251, 1),
              Color.fromRGBO(143, 148, 251, 1),
              Color.fromRGBO(143, 148, 251, 0.4),
            ],
          ),
        ),
        child: Center(
          child: Text(
            "Change",
            style: TextStyle(
                fontSize: media.getwidht(16),
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
