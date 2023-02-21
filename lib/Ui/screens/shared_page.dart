import 'package:chat_for_peace/Ui/widgets/idesWidget.dart';
import 'package:chat_for_peace/core/view-models/idea_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../utilities/mediaQuery.dart';
import 'ideaForm.dart';

class SharedPage extends StatefulWidget {
  const SharedPage({Key? key}) : super(key: key);

  @override
  State<SharedPage> createState() => _SharedPageState();
}

class _SharedPageState extends State<SharedPage> {
  bool isMine = false;

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    Mediaquery media =
        Mediaquery(mediaHeight: deviceHeight, mediaWidth: deviceWidth);

    return Consumer<IdeaProvider>(builder: (context, ideaProvider, child) {
      ideaProvider.getIdeas();
      ideaProvider.getMyIdeas();
      print(ideaProvider.ideas);
      return Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: media.getHeight(30)),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: isMine
                      ? ideaProvider.myIdeas
                          .map((e) => IdeaWidget(
                                idea: e,
                                ButtonType: false,
                              ))
                          .toList()
                      : ideaProvider.ideas
                          .map((e) => IdeaWidget(
                                idea: e,
                                ButtonType: true,
                              ))
                          .toList(),
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
                    size: media.getwidht(25),
                  ),
                  label: "Create new Idea",
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ideaForm()));
                  },
                  labelBackgroundColor: Color.fromRGBO(143, 148, 251, 0.6),
                  labelStyle: TextStyle(
                    fontSize: media.getwidht(16),
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Courgette',
                    color: Colors.purple,
                  ),
                ),
                SpeedDialChild(
                  onTap: () {
                    print(ideaProvider.myIdeas);
                    print(1);
                    setState(() {
                      isMine = true;
                    });
                  },
                  child: Icon(
                    Icons.lightbulb,
                    color: Colors.purple,
                    size: media.getwidht(25),
                  ),
                  label: "Your current ideas",
                  labelBackgroundColor: Color.fromRGBO(143, 148, 251, 0.6),
                  labelStyle: TextStyle(
                    fontSize: media.getwidht(16),
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Courgette',
                    color: Colors.purple,
                  ),
                ),
                SpeedDialChild(
                  onTap: () async {
                    setState(() {
                      isMine = false;
                    });
                  },
                  child: Icon(
                    FontAwesomeIcons.arrowRotateRight,
                    color: Colors.purple,
                    size: media.getwidht(25),
                  ),
                  label: "All ideas",
                  labelBackgroundColor: Color.fromRGBO(143, 148, 251, 0.6),
                  labelStyle: TextStyle(
                    fontSize: media.getwidht(16),
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Courgette',
                    color: Colors.purple,
                  ),
                ),
              ],
            ),
            bottom: media.getHeight(20),
            right: media.getwidht(15),
          ),
        ],
      );
    });
  }
}
