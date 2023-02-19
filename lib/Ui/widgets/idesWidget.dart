import 'package:flutter/material.dart';

class IdeaWidget extends StatelessWidget {
  const IdeaWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(143, 148, 251, 2),
                blurRadius: 20.0,
                offset: Offset(0, 10),
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Center(
                  child: Text(
                    "Mohamed amine guesmi",
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                        fontFamily: 'Courgette'),
                  ),
                ),
              ),
              Divider(),
              Expanded(
                  child: Align(
                child: Row(
                  children: [
                    Text(
                      "Idea Title :",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                          fontFamily: 'Courgette'),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text("---------"),
                  ],
                ),
                alignment: Alignment.centerLeft,
              )),
              Divider(),
              Expanded(
                child: Align(
                  child: Text(
                    "Idea description :",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                        fontFamily: 'Courgette'),
                  ),
                  alignment: Alignment.topLeft,
                ),
                flex: 6,
              ),
              Divider(),
              Expanded(
                  child: Container(
                child: Row(
                  children: [
                    Text(
                      "supports",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                          fontFamily: 'Courgette'),
                    ),
                    SizedBox(
                      width: 110,
                    ),
                    Text("152"),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
