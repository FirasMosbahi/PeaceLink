import 'package:PeaceLink/Ui/screens/chat_Page.dart';
import 'package:PeaceLink/core/view-models/chat_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

import '../utilities/mediaQuery.dart';
import '../widgets/messageWidget.dart';

class ChatRoom extends StatefulWidget {
  ChatRoom({Key? key}) : super(key: key);
  TextEditingController tx = TextEditingController();

  @override
  State<ChatRoom> createState() => _ChatState();
}

class _ChatState extends State<ChatRoom> {
  String msgToSend = "";

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    Mediaquery media =
        Mediaquery(mediaHeight: deviceHeight, mediaWidth: deviceWidth);
    return Consumer<ChatProvider>(
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
            stops: [0, 0.48, 0.7, 1],
          ),
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GestureDetector(
                  onTap: () async {
                    FocusScope.of(context).unfocus();
                    await chatProvider.endChat();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ChatPage()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(143, 148, 251, 2),
                          blurRadius: 20.0,
                          offset: Offset(0, 10),
                        )
                      ],
                    ),
                    child: Center(
                        child: Text(
                      "retour",
                      style: TextStyle(
                        fontFamily: 'Courgette',
                        fontWeight: FontWeight.w700,
                        fontSize: media.getwidht(20),
                        color: Colors.grey[600],
                      ),
                    )),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: chatProvider.chat
                          .map((e) => message(
                              text: e[e.keys.first] ?? "", id: e.keys.first))
                          .toList(),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(143, 148, 251, 2),
                        blurRadius: 20.0,
                        offset: Offset(0, 10),
                      )
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(media.getwidht(8)),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: media.getwidht(20)),
                            height: media.getwidht(45),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              controller: widget.tx,
                              onChanged: (value) => msgToSend = value,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Your Message",
                                hintStyle: TextStyle(
                                  color: Colors.grey[400],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: media.getwidht(5)),
                        GestureDetector(
                          onTap: () async {
                            try {
                              await chatProvider.sendMessage(msgToSend);
                            } catch (e) {
                              e.toString();
                            }
                            setState(() {
                              widget.tx.text = '';
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              size: media.getwidht(40),
                              Icons.arrow_forward,
                              color: Colors.purple,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
