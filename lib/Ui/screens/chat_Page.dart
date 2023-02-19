import 'package:flutter/material.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScaffoldGradientBackground(
        gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1e0059),
              Color(0xFF49125c),
              Color(0xFf3b246a),
              Color(0xFF926b9f),
            ],
            stops: [
              0,
              0.48,
              0.7,
              1
            ]),
        body: Column(
          children: [
            Text(
              "Welcome To Chat Area ",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontFamily: 'Courgette',
                fontSize: 50,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 160,
            ),
            Center(
              child: Container(
                height: 250,
                width: 350,
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
                  padding: const EdgeInsets.only(top: 8),
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Chat With Specialist ",
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontFamily: 'Courgette',
                                fontSize: 20,
                              ),
                            ),
                            Spacer(),
                            Container(
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
                                  "Go For Chat",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 5,
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Chat With Child ",
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontFamily: 'Courgette',
                                fontSize: 20,
                              ),
                            ),
                            Spacer(),
                            Container(
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
                                  "Go For Chat",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 5,
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Chat With Adolisant ",
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontFamily: 'Courgette',
                                fontSize: 20,
                              ),
                            ),
                            Spacer(),
                            Container(
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
                                  "Go For Chat",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 5,
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Chat With Old Person ",
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontFamily: 'Courgette',
                                fontSize: 20,
                              ),
                            ),
                            Spacer(),
                            Container(
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
                                  "Go For Chat",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              bottom: 15, top: 10, right: 20),
                          child: Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () {},
                              child: const Text(
                                "retour",
                                style: TextStyle(
                                  color: Color.fromRGBO(143, 148, 251, 1),
                                  fontFamily: 'Courgette',
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
