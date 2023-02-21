import 'package:flutter/material.dart';

import '../utilities/mediaQuery.dart';

class message extends StatelessWidget {
  final String text;
  final int id;
  const message({Key? key, required this.text, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    Mediaquery media =
        Mediaquery(mediaHeight: deviceHeight, mediaWidth: deviceWidth);
    return Container(
      width: media.getwidht(360),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Align(
        alignment: id == 2 ? Alignment.centerLeft : Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: DecoratedBox(
            // chat bubble decoration
            decoration: BoxDecoration(
              color: Color.fromRGBO(143, 148, 251, 1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: EdgeInsets.all(media.getwidht(12)),
              child: Text(
                text,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
