import 'package:PeaceLink/Ui/screens/main_screen.dart';
import 'package:PeaceLink/core/view-models/chat_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

import '../utilities/mediaQuery.dart';
import 'chatScreen.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    Mediaquery media =
        Mediaquery(mediaHeight: deviceHeight, mediaWidth: deviceWidth);
    return SafeArea(child: Consumer<ChatProvider>(
      builder: (context, chatProvider, child) {
        return ScaffoldGradientBackground(
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
                  fontSize: media.getwidht(50),
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: media.getHeight(160),
              ),
              Center(
                child: Container(
                  height: media.getHeight(250),
                  width: media.getwidht(350),
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
                    padding: EdgeInsets.only(top: media.getHeight(8)),
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              SizedBox(
                                width: media.getwidht(10),
                              ),
                              Text(
                                "Chat With Specialist ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontFamily: 'Courgette',
                                  fontSize: media.getwidht(20),
                                ),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () async {
                                  chatProvider.needReload = true;
                                  await chatProvider.searchByCriteria(
                                      criteria: "specialist",
                                      chatAsSpecialist: true);
                                  await chatProvider.startGettingMessages();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ChatRoom()));
                                },
                                child: Container(
                                  height: media.getHeight(50),
                                  width: media.getwidht(120),
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
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: media.getHeight(5),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              SizedBox(
                                width: media.getwidht(10),
                              ),
                              Text(
                                "Chat With Child ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontFamily: 'Courgette',
                                  fontSize: media.getwidht(20),
                                ),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () async {
                                  try {
                                    chatProvider.needReload = true;
                                    await chatProvider.searchByCriteria(
                                        criteria: "child",
                                        chatAsSpecialist: true);
                                  } catch (e) {
                                    print(e.toString());
                                  }
                                  await chatProvider.startGettingMessages();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ChatRoom()));
                                },
                                child: Container(
                                  height: media.getHeight(50),
                                  width: media.getwidht(120),
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
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: media.getHeight(5),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              SizedBox(
                                width: media.getwidht(10),
                              ),
                              Text(
                                "Chat With Adolescent ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontFamily: 'Courgette',
                                  fontSize: media.getwidht(20),
                                ),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () async {
                                  chatProvider.needReload = true;
                                  await chatProvider.searchByCriteria(
                                      criteria: "adolescent",
                                      chatAsSpecialist: true);
                                  await chatProvider.startGettingMessages();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ChatRoom()));
                                },
                                child: Container(
                                  height: media.getHeight(50),
                                  width: media.getwidht(120),
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
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: media.getHeight(5),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              SizedBox(
                                width: media.getwidht(10),
                              ),
                              Text(
                                "Chat With Old Person ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontFamily: 'Courgette',
                                  fontSize: media.getwidht(20),
                                ),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () async {
                                  chatProvider.needReload = true;
                                  await chatProvider.searchByCriteria(
                                      criteria: "old", chatAsSpecialist: true);
                                  await chatProvider.startGettingMessages();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ChatRoom()));
                                },
                                child: Container(
                                  height: media.getHeight(50),
                                  width: media.getwidht(120),
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
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                                bottom: media.getHeight(15),
                                top: media.getHeight(10),
                                right: media.getwidht(20)),
                            child: Align(
                              alignment: Alignment.center,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MyApp(index: 2)));
                                },
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
        );
      },
    ));
  }
}
