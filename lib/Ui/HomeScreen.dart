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
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF20061D),
                          Color(0xFFAFB09A),
                        ])),
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
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
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
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    letterSpacing: 0.2),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            MyApp(0, appBar)));
                              },
                              child: Text("Denote"),
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                backgroundColor: Color(0xFFEFD54C),
                                primary: Colors.black,
                                fixedSize: Size(149, 22),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ))),
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
                    style: TextStyle(fontSize: 18, color: Color(0xFFFFFFFF)),
                  )),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Disaster",
                              style: TextStyle(
                                  fontSize: 13.5,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.purple,
                                  fontFamily: 'Courgette'),
                            ),
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(22)),
                              backgroundColor: Color(0xFFEFD54C),
                              primary: Colors.black,
                              fixedSize: Size(62, 57),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        Expanded(
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Wars",
                              style: TextStyle(
                                fontSize: 13.5,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Courgette',
                                color: Colors.purple,
                              ),
                            ),
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(22)),
                              backgroundColor: Color(0xFFEFD54C),
                              primary: Colors.black,
                              fixedSize: Size(62, 57),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        Expanded(
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Poverty",
                              style: TextStyle(
                                fontSize: 13.5,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Courgette',
                                color: Colors.purple,
                              ),
                            ),
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(22)),
                              backgroundColor: Color(0xFFEFD54C),
                              primary: Colors.black,
                              fixedSize: Size(62, 57),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Hunger",
                              style: TextStyle(
                                fontSize: 13.5,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Courgette',
                                color: Colors.purple,
                              ),
                            ),
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(22)),
                              backgroundColor: Color(0xFFEFD54C),
                              primary: Colors.black,
                              fixedSize: Size(62, 57),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 15,
                  ),
                  Expanded(
                      flex: 5,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
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
                                                    AlwaysStoppedAnimation<
                                                        Color>(Colors.purple),
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
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 17,
                                        ),
                                        Text("1250 Donators"),
                                        SizedBox(
                                          width: 110,
                                        ),
                                        Text("19 days left"),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ))
                ],
              ),
            )),
        Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFFAFB09A),
                        Color(0xFF20061D),
                      ])),
              margin: EdgeInsets.only(top: 35, left: 50, right: 50, bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                          "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa      aaaaaaaaaaaaaa aaaaaaaaaaaaaa"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 20,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Icon(
                            FontAwesomeIcons.handPeace,
                          ),
                        ),
                        Expanded(
                            child: Icon(FontAwesomeIcons.handHoldingHeart)),
                        Expanded(child: Icon(Icons.celebration_outlined)),
                      ],
                    ),
                  )
                ],
              ),
            ))
      ],
    );
  }
}
