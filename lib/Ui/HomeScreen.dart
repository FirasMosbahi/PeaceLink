import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'MainScreen.dart';
import 'template.dat.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            flex: 1,
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(143, 148, 251, 2),
                        blurRadius: 20.0,
                        offset: Offset(0, 10),
                      )
                    ]),
                margin: EdgeInsets.only(top: 35, left: 40, right: 40),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 7),
                        child: Container(
                          height: 60,
                          width: 70,
                          child: Icon(
                            FontAwesomeIcons.wallet,
                            size: 35,
                            color: Color.fromRGBO(143, 148, 251, 1),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromRGBO(143, 148, 251, 0.2),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                "We make a living by what we\n get . We make a life by what we \ngive 🥰",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Kranky',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[500],
                                    letterSpacing: 0.2),
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            MyApp(1, appBar)));
                              },
                              child: Container(
                                height: 50,
                                width: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
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
                                  child: Text(
                                    "Donate",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ))),
        SizedBox(
          height: 20,
        ),
        Expanded(
          flex: 2,
          child: Container(
            margin: EdgeInsets.only(top: 35, left: 40, right: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Text(
                  "Urgent Donation",
                  style: TextStyle(fontSize: 18, color: Colors.grey[800]),
                )),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromRGBO(190, 120, 251, 0.6),
                                  Color.fromRGBO(190, 120, 251, 0.4),
                                  Color.fromRGBO(190, 120, 251, 0.8),
                                ],
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Disaster",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 14,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromRGBO(190, 120, 251, 0.6),
                                  Color.fromRGBO(190, 120, 251, 0.4),
                                  Color.fromRGBO(190, 120, 251, 0.8),
                                ],
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Wars",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 14,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromRGBO(190, 120, 251, 0.6),
                                  Color.fromRGBO(190, 120, 251, 0.4),
                                  Color.fromRGBO(190, 120, 251, 0.8),
                                ],
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Poverty",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromRGBO(190, 120, 251, 0.6),
                                  Color.fromRGBO(190, 120, 251, 0.4),
                                  Color.fromRGBO(190, 120, 251, 0.8),
                                ],
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Hunger",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 30,
                ),
                Expanded(
                    flex: 7,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(143, 148, 251, 2),
                            blurRadius: 20.0,
                            offset: Offset(0, 10),
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 6,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("assets/img.jpg"),
                                  )),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Container(
                              child: Column(
                                children: [
                                  Text(
                                    "description of urgent situation ",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "1200£ fund was raised ",
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Center(child: Text("0£")),
                                        flex: 1,
                                      ),
                                      Expanded(
                                          flex: 4,
                                          child: Center(
                                            child: LinearProgressIndicator(
                                              value: 0.6,
                                              backgroundColor: Colors.black12,
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                      Colors.purple),
                                            ),
                                          )),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Center(child: Text("1600£")),
                                        flex: 1,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text("1250 person donate"),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      height: 50,
                                      width: 220,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            topRight: Radius.circular(10)),
                                        gradient: LinearGradient(
                                          colors: [
                                            Color.fromRGBO(143, 148, 251, 1),
                                            Color.fromRGBO(143, 148, 251, 0.9),
                                            Color.fromRGBO(143, 148, 251, 0.2),
                                          ],
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Donate",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      height: 50,
                                      width: 220,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(10),
                                            topLeft: Radius.circular(10)),
                                        gradient: LinearGradient(
                                          colors: [
                                            Color.fromRGBO(143, 148, 251, 0.2),
                                            Color.fromRGBO(143, 148, 251, 0.9),
                                            Color.fromRGBO(143, 148, 251, 1),
                                          ],
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Create ",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
