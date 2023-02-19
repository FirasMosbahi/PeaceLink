import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/idesWidget.dart';
import 'ideaForm.dart';

class SharedPage extends StatelessWidget {
  const SharedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                children: [
                  IdeaWidget(),
                  IdeaWidget(),
                  IdeaWidget(),
                  IdeaWidget(),
                  IdeaWidget(),
                  IdeaWidget(),
                  IdeaWidget(),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          child: SpeedDial(
            overlayOpacity: 0.2,
            spaceBetweenChildren: 15,
            animatedIcon: AnimatedIcons.menu_close,
            backgroundColor: Color.fromRGBO(143, 148, 251, 1),
            children: [
              SpeedDialChild(
                child: Icon(
                  Icons.add,
                  color: Colors.purple,
                  size: 25,
                ),
                label: "Create new Idea",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ideaForm()));
                },
                labelBackgroundColor: Color.fromRGBO(143, 148, 251, 0.6),
                labelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Courgette',
                  color: Colors.purple,
                ),
              ),
              SpeedDialChild(
                child: Icon(
                  Icons.lightbulb,
                  color: Colors.purple,
                  size: 25,
                ),
                label: "Your current ideas",
                labelBackgroundColor: Color.fromRGBO(143, 148, 251, 0.6),
                labelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Courgette',
                  color: Colors.purple,
                ),
              ),
              SpeedDialChild(
                child: Icon(
                  FontAwesomeIcons.arrowRotateRight,
                  color: Colors.purple,
                  size: 25,
                ),
                label: "All ideas",
                labelBackgroundColor: Color.fromRGBO(143, 148, 251, 0.6),
                labelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Courgette',
                  color: Colors.purple,
                ),
              ),
            ],
          ),
          bottom: 20,
          right: 15,
        ),
      ],
    );
  }
}
