import 'package:chat_for_peace/Ui/screens/cardPaiement.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/template.dat.dart';
import 'main_screen.dart';

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
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(143, 148, 251, 2),
                        blurRadius: 20.0,
                        offset: Offset(0, 10),
                      )
                    ]),
                margin: const EdgeInsets.only(top: 35, left: 40, right: 40),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 7),
                        child: Container(
                          height: 60,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromRGBO(143, 148, 251, 0.2),
                          ),
                          child: const Icon(
                            FontAwesomeIcons.wallet,
                            size: 35,
                            color: Color.fromRGBO(143, 148, 251, 1),
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
                                "We make a living by what we get . We make a life by what we give 🥰",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Courgette',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[500],
                                    letterSpacing: 0.2),
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            MyApp(index: 0, appBar: appBar)));
                              },
                              child: Container(
                                height: 50,
                                width: 120,
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
                                child: const Center(
                                  child: Text(
                                    "Donate",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ))),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          flex: 2,
          child: Container(
            margin: const EdgeInsets.only(top: 35, left: 40, right: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(
                    child: Text(
                  "Urgent Donation",
                  style: TextStyle(fontSize: 18, color: Colors.pinkAccent),
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
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromRGBO(190, 120, 251, 0.6),
                                  Color.fromRGBO(190, 120, 251, 0.4),
                                  Color.fromRGBO(190, 120, 251, 0.8),
                                ],
                              ),
                            ),
                            child: const Center(
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
                      const SizedBox(
                        width: 14,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromRGBO(190, 120, 251, 0.6),
                                  Color.fromRGBO(190, 120, 251, 0.4),
                                  Color.fromRGBO(190, 120, 251, 0.8),
                                ],
                              ),
                            ),
                            child: const Center(
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
                      const SizedBox(
                        width: 14,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromRGBO(190, 120, 251, 0.6),
                                  Color.fromRGBO(190, 120, 251, 0.4),
                                  Color.fromRGBO(190, 120, 251, 0.8),
                                ],
                              ),
                            ),
                            child: const Center(
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
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromRGBO(190, 120, 251, 0.6),
                                  Color.fromRGBO(190, 120, 251, 0.4),
                                  Color.fromRGBO(190, 120, 251, 0.8),
                                ],
                              ),
                            ),
                            child: const Center(
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
                const SizedBox(
                  width: double.infinity,
                  height: 30,
                ),
                Expanded(
                    flex: 7,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: const [
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
                              decoration: const BoxDecoration(
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
                                  const Text(
                                    "description of urgent situation ",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text(
                                    "1200£ fund was raised ",
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                  Row(
                                    children: const [
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
                                        flex: 1,
                                        child: Center(child: Text("1600£")),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Text("1250 person donate"),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CardPaiement("")));
                                    },
                                    child: Container(
                                      height: 50,
                                      width: 220,
                                      decoration: const BoxDecoration(
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
                                      child: const Center(
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
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      height: 50,
                                      width: 220,
                                      decoration: const BoxDecoration(
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
                                      child: const Center(
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
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
